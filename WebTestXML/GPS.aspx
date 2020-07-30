<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GPS.aspx.cs" Inherits="WebTestXML.GPS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script type="text/javascript" src="Content/Lib/jquery.1.9.1.min.js"></script>    
    <script>
        //        $(document).ready(function () {
        //            getLocation();
        //        });

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(SendPosition);
            } else {
                document.getElementById('Details').value
                //x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }

        function SendPosition(position) {
            var dir = ""
            try {
                var geocoder = new google.maps.Geocoder;
                var latlng = { lat: position.coords.latitude, lng: position.coords.longitude };
                geocoder.geocode({ 'location': latlng }, function (results, status) {
                    if (status === 'OK') {
                        if (results[1]) {
                            dir = results[1].formatted_address;
                            Enviar(position, dir)
                        } else {
                            alert("No results found;");
                            Enviar(position, dir)
                            //No results found;
                        }
                    } else {
                        alert("Geocoder failed due to: " + status);
                        Enviar(position, dir)
                        //Geocoder failed due to: ' + status;
                    }
                });
            } catch (err) { Enviar(position, dir); }
        }

        function Enviar(position, dir) {
            document.getElementById('HFLatLon').value = position.coords.latitude + "," + position.coords.longitude;
            document.getElementById('HFAddress').value = dir;
            
        }
    </script>
	   <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRbGMf9rtEI31tnOuV-66iEHoJ9vefwqw&callback=getLocation">
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input id="Details" type="text" />
    <input id="HFLatLon" type="text" />
    <input id="HFAddress" type="text" />
        
    </div>
    </form>
</body>
</html>
