
var lattitd = document.getElementById("lat").innerHTML;
var langitd = document.getElementById("lng").innerHTML;
var position = navigator.geolocation;

console.log("Lattitude" + document.getElementById("lat").innerHTML + "  Longitude" + document.getElementById("lng").innerText);

function initMap()
{
    position.getCurrentPosition(success, failure);

    function success(position) 
    {
        var mylat = document.getElementById("lat").innerHTML;
        var mylong = document.getElementById("lng").innerHTML;

        var coords = new google.maps.LatLng(mylat, mylong);

        var mapOptions = {
            zoom: 15,
            center: coords,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var marker = new google.maps.Marker({
            map: map,
            position: coords,
            draggable: true,
            title: "Drag me!",
            anchorPoint: new google.maps.Point(0, -29)
        });

        // const citymap = {
        //     center: coords,
        //     population: 1,
        // };

        const cityCircle = new google.maps.Circle({
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#FF0000",
            fillOpacity: 0.35,
            map,
            center: coords,
            radius: 10,
            //draggable:true,
        });

         

        var circle = cityCircle;

        marker.addListener("mouseup", setnewmarker);

        var newcoords;

        function newradius(cord) {
            circle.setMap(null);
            const cityCircle = new google.maps.Circle({
                strokeColor: "#FF0000",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#FF0000",
                fillOpacity: 0.35,
                map,
                center: cord,
                radius: 10,
                //draggable:true,
            });
        }

        var i = 0;
        function setnewmarker() {

            if(i==0)
            {
                newcoords = marker.position;

                newlatitude = marker.position.lat();
                newlongitude = marker.position.lng();

                newradius(newcoords);
                // marker.setDraggable(false);

                document.getElementById("lat").value= newlatitude;
                document.getElementById("lng").value = newlongitude;

                console.log("New Marker Position: " + newcoords);
                console.log("latitude Position: " + newlatitude);
                console.log("Longitude Position: " + newlongitude); 
                i++;
            }
            else
            {
                
                alert("You have already marked, Press ok to Reload the Map");
                // window.location.href = "Google Map Api.html";
                initMap();
            }
           
        }
        
    }

    function failure() 
    {
        alert("Please Allow Location to access Map");
        initMap();
    }
}


