<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistanciaDe_AB.aspx.cs" Inherits="FuncionesTipoUber.View.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Calcular la distancia del punto A. Punto B</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


  <!-- API_KEY Google Maps -->
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?key=AIzaSyBYlFOtKiNr6qhNwSIhAZj2KkXWDwdku5k&libraries=drawing,geometry'></script>

    <!--Complementos-->
    <script src="js/map.js"></script>
    <link href="css/style.css" rel="stylesheet" />

</head>
<body>
    
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <!--Mapa-->
                <div class="col-md-6">
                    <br />
                    <p>Mapa</p>
                    <br />
                    <div id="map"></div>
                </div>
                <!--Puntos A-->
                <div class="col-md-3">
                    <br />
                    <p>Punto A</p>
                    <br />
                    <asp:Label Text="Lat " runat="server" />
                    <asp:TextBox ID="A_Lat" CssClass="form-control" runat="server"></asp:TextBox> 
                    <asp:HiddenField ID="txt_A_Lat" runat="server" />
                    <asp:Label Text="Lng " runat="server" />
                    <asp:TextBox ID="A_Lng" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="txt_A_Lng" runat="server" />
                </div>
                <!--Puntos B-->
                 <div class="col-md-3">
                     <br />
                    <p>Punto B</p>
                    <br />
                     <asp:Label Text="Lat " runat="server" />
                    <asp:TextBox ID="B_Lat" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Label Text="Lng " runat="server" />
                    <asp:TextBox ID="B_Lng" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                 <!--Distancia-->
                 <div class="col-md-3">
                   
                    <br />
                     <asp:Label Text="Distancia entre Punto A y punto B" runat="server" />
                    <asp:TextBox ID="Distancia" CssClass="form-control" runat="server"></asp:TextBox>
                    
                </div>

                 <!--Button Calcular -->
                 <div class="col-md-3">
                    <p>Punto A</p>
                    <br />
                     <asp:Button ID="btnCalcular" UseSubmitBehavior="false" CssClass="btn btn-success" runat="server" Text="Button" OnClick="btnCalcular_Click" Width="151px" />
                   
                    
                </div>
            </div>
        </div>
    </form>
    <script>
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
                //Propiedades del Marcador
                marker = new google.maps.Marker({
                    position: geolocate,
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    crossOnDrag: true,
                    animation: 0,
                    title: 'Punto A!',

                });
                map.setCenter(geolocate);
                //Enviar Ubicacion Actual a ASP.NET
                document.getElementById('<%=A_Lat.ClientID%>').value = geolocate.lat();
                document.getElementById('<%=A_Lng.ClientID%>').value = geolocate.lng();
            });

            //Propiedades al mapa
            var drawingManager = new google.maps.drawing.DrawingManager({
                drawingControlOptions: {
                    drawingModes: ['marker']
                },
                drawingControl: true,
               
            });
            drawingManager.setMap(map);
            var currEvent;
            marker = new google.maps.Marker({
                position: MyLatLon,
                map: map,
                draggable: true,
                animation: google.maps.Animation.DROP,
                crossOnDrag: true,
                visible: true,
                animation: 0,
                title: 'Carrito!',
                clickable: false,

            });
            
            //marker.addListener("click", toggleBounce);

            //Crear un marcador con dar click en el mapa
            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {
                currEvent = event.type;
                console.log(currEvent);

                if (event.type == 'marker') {
                    var position2 = event.overlay.getPosition();
                    marker = {
                        center: {
                            lat: position2.lat(),
                            lng: position2.lng()
                        }
                    }
                    document.getElementById('<%=B_Lat.ClientID%>').value = position2.lat();
                        document.getElementById('<%=B_Lng.ClientID%>').value = position2.lng();
                    } else {
                        console.log("ocurre algo raro!!");
                    }
                    
                }); 
        }
    </script>
</body>
</html>
