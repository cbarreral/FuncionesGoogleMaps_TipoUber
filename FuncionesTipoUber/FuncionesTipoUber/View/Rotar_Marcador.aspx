<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rotar_Marcador.aspx.cs" Inherits="FuncionesTipoUber.Rotar_Marcador" %>

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
            <div class="row">
                <div class="col-md-5">
                    <div id="map"></div>
                </div>
                <asp:HiddenField ID="txtGrado" runat="server" />
                
            </div>

        </div>
    </form>
    <script>var marker;
        window.onload = function () {
           
            const MyLatLng = { lat: -34.397, lng: 150.644 };

            //Dibujar mapa
            map = new google.maps.Map(document.getElementById('map'), {
                center: MyLatLng,
                zoom: 18,
                mapTypeID: google.maps.MapTypeId.ROADMAP,
            });

            //Obtener Ubicación actual
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocate = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

                marker = new google.maps.Marker({
                    position: geolocate,
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    crossOnDrag: true,
                    visible: true,
                    animation: 0,
                    title: 'Carrito!',
                    icon: carrito,
                    clickable: false,

                });
                map.setCenter(geolocate);
                marker.addListener("click", toggleBounce);


            });
          
            var grados = document.getElementById('<%=txtGrado.ClientID%>').value;
            setRotation(grados);
        }

     
        //Rotar Marcador
        function setRotation(grados) {
            console.log("grados de movimiento: "+grados);
            var heading = parseInt(grados);
            if (isNaN(heading)) heading = 0;
            if (heading < 0) heading = 359;
            if (heading > 359) heading = 0;
            carrito.rotation = heading;
            marker.setOptions({ icon: carrito });
            document.getElementById('txtGrado').value = heading;
            if (window.DeviceOrientationEvent) {
                window.addEventListener('deviceorientation', deviceOrientationHandler, false);
                document.getElementById("doeSupported").innerText = "Supported!";
                alert("soportado");
            } else {
                alert("no soportado");
            }
        }
        //Animar marcador
        function toggleBounce() {
            if (marker.getAnimation() !== null) {
                marker.setAnimation(null);
            } else {
                marker.setAnimation(google.maps.Animation.BOUNCE);
            }
        }
        var carrito = {
            path: 'M -1.1500216e-4,0 C 0.281648,0 0.547084,-0.13447 0.718801,-0.36481 l 17.093151,-22.89064 c 0.125766,-0.16746 0.188044,-0.36854 0.188044,-0.56899 0,-0.19797 -0.06107,-0.39532 -0.182601,-0.56215 -0.245484,-0.33555 -0.678404,-0.46068 -1.057513,-0.30629 l -11.318243,4.60303 0,-26.97635 C 5.441639,-47.58228 5.035926,-48 4.534681,-48 l -9.06959,0 c -0.501246,0 -0.906959,0.41772 -0.906959,0.9338 l 0,26.97635 -11.317637,-4.60303 c -0.379109,-0.15439 -0.812031,-0.0286 -1.057515,0.30629 -0.245483,0.33492 -0.244275,0.79809 0.0055,1.13114 L -0.718973,-0.36481 C -0.547255,-0.13509 -0.281818,0 -5.7002158e-5,0 Z',
            strokeColor: 'black',
            strokeOpacity: 1,
            strokeWeight: 1,
            fillColor: '#fefe99',
            fillOpacity: 1,
            rotation: 0,
            scale: 1.0
        }
    </script>
</body>
</html>
