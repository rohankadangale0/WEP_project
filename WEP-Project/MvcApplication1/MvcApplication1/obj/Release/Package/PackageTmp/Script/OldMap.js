// Map with Static Markaer

// function initMap()
//   {
//     // var location = {lat: 15.458778899720455, lng: 73.83426781203619};
//     // var map = new google.maps.Map(document.getElementById("map"), 
//     // {zoom: 23, center: location});

//     // var marker = new google.maps.Marker({position: location, map: map});

//   }

      
// Map marker with User location


function sleep(ms) 
{
    return new Promise(resolve => setTimeout(resolve, ms));
}

var chngcolor;

function getcolor(color)
{
    // await sleep(2000);
    console.log("OldmapJS Value of color: " +color);
    chngcolor = color;
    
}

var position = navigator.geolocation;

async function initMap()
{
    
    await sleep(10000);

    position.getCurrentPosition(success, failure);

    function success(position) 
    {
        var mylat = position.coords.latitude;
        var mylong = position.coords.longitude;

        document.getElementById("lat").value= mylat;
        document.getElementById("lng").value = mylong;

        var coords = new google.maps.LatLng(mylat, mylong);

        var mapOptions = {
            zoom: 23,
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
        /*
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
        });*/

        var water = "#8abdf0";
        var electricity = "#d1dc6a";
        var road = "#241f1fd4";
        var defaultcolor = "#FF0000";

        if(chngcolor == "water")
        {
            //alert("Blue");
            //initMap();
            const cityCircle = new google.maps.Circle({
                strokeColor: water,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: water,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
                //draggable:true,
            });

            var circle = cityCircle;
        }
        else if(chngcolor == "electricity")
        {
            const cityCircle = new google.maps.Circle({
                strokeColor: electricity,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: electricity,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
                //draggable:true,
            });

            var circle = cityCircle;
        }
        else if(chngcolor == "road")
        {
            
            //initMap();
            const cityCircle = new google.maps.Circle({
                strokeColor: road,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: road,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
                //draggable:true,
            });

            var circle = cityCircle;
        }
        else
        {
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
        }
         

       // var circle = cityCircle;

        marker.addListener("mouseup", setnewmarker);

        var newcoords;

        function newradius(cord,chngcolor) 
        {
            circle.setMap(null);
            const cityCircle = new google.maps.Circle({
                strokeColor: chngcolor,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: chngcolor,
                fillOpacity: 0.35,
                map,
                center: cord,
                radius: 10,
                //draggable:true,
            });
        }

        // function unsetmarker() {
        //     circle.setMap(null);
        // }

        var i = 0,newcolor;
        function setnewmarker() {

            if(i==0)
            {
                newcoords = marker.position;

                newlatitude = marker.position.lat();
                newlongitude = marker.position.lng();

                if(chngcolor == "water")
                {
                    newcolor = water;
                }
                else if(chngcolor == "electricity")
                {
                    newcolor = electricity;
                }
                else if(chngcolor == "road")
                {
                    newcolor = road;
                }
                else
                {   
                    newcolor = defaultcolor;
                }

                newradius(newcoords,newcolor);
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

