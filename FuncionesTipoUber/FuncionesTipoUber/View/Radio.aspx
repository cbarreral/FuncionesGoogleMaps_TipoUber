<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Radio.aspx.cs" Inherits="FuncionesTipoUber.View.Radio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
          <title>Marker con radio</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  


    <link href="css/style.css" rel="stylesheet" />
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <!-- API_KEY Google Maps -->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?key=AIzaSyBYlFOtKiNr6qhNwSIhAZj2KkXWDwdku5k&libraries=drawing,geometry'></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <br />

            <div class="row">
                <!--Mapa-->
                <div class="col-md-6">
                    <br />
                    <p>Mapa</p>
                    <br />
                    <div id="map"></div>
                </div>
                <!--Geolocalizacion-->
                <div class="col-md-3">
                    <br />
                    <asp:Label Text="Cordenadas " runat="server" />
                    <asp:TextBox ID="Lat" CssClass="form-control" Text="20.218280999999998" runat="server"></asp:TextBox> 
                    <asp:TextBox ID="Lng" CssClass="form-control" Text="-99.24503140000002" runat="server"></asp:TextBox>
               <asp:TextBox ID="txtRadio" CssClass="form-control" Text="50" runat="server"></asp:TextBox>
               
                         
                </div>
            </div>
        </div>
    </form>
    <script>
        var ubi;
        window.onload = function () {
            var marker;
            const MyLatLon = { lat: -34.397, lng: 150.644 };//Posicion como ejemplo
            //Dibujar Mapa
            map = new google.maps.Map(document.getElementById("map"), {
                center: MyLatLon,
                zoom: 15,
                mapTypeID: google.maps.MapTypeId.ROADMAP,

            });
            //Optener mi ubicacion actual
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocate = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
               // document.getElementById('<%=Lat.ClientID%>').value = geolocate.lat();     
               // document.getElementById('<%=Lng.ClientID%>').value = geolocate.lng();

              
           
            });
            var longi = document.getElementById('<%=Lng.ClientID%>').value;
                var lati = document.getElementById('<%=Lat.ClientID%>').value;
                 ubi = new google.maps.LatLng(lati, longi);

               //Propiedades del Marcador
                marker = new google.maps.Marker({
                    position: ubi,
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    crossOnDrag: true,
                    animation: 0,
                    title: 'Radio',

                });
          
              map.setCenter(ubi);
            document.getElementById('<%=Lat.ClientID%>').value = ubi.lat();
            document.getElementById('<%=Lng.ClientID%>').value = ubi.lng();
             //Resibe la distacia del radio desde C#   
            var radio = parseInt(document.getElementById('<%=txtRadio.ClientID%>').value);
               
            // Add circle overlay and bind to marker
            var circle = new google.maps.Circle({
                map: map,
                radius: radio,    // radio en metros
                fillColor: '#AA0000'
            });
              
                circle.bindTo('center', marker, 'position');
            document.getElementById('<%=txtRadio.ClientID%>').value = circle.radius;
                //Dibujar en Mapa
            const drawingManager = new google.maps.drawing.DrawingManager({
                drawingMode: google.maps.drawing.OverlayType.MARKER,
                drawingControl: true,
                //Centrar circulo en marker
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                        google.maps.drawing.OverlayType.MARKER,

                    ],
                },
                //Propiedades del circulo
                circleOptions: {
                    fillColor: "#ffff00",
                    fillOpacity: .3,
                    strokeWeight: 5,
                    clickable: false,
                    editable: true,
                    zIndex: 1,
                    draggable: true,
                },
              //Propiedades del marker
                markerOptions: {
                    clickable: true,
                    editable: true,
                    draggable: true,
                    title: 'Soy un nuevo marcador',
                }
            });
            drawingManager.setMap(map);
        }
    </script>
</body>
</html>
