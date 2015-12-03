var location1 = document.getElementById("demo1");
    
    function getLocation(id, cb) {

        var location = document.getElementById(id);

        if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position){

            		cb({
            			latitude : position.coords.latitude,
            			longitude : position.coords.longitude,
            			time : Date.now()
            		});

                });
        } 
        else { 
                location.innerHTML = "Geolocation is not supported by this browser.";
        }
    };            

    var startButton = document.getElementById("start");
    var stopButton = document.getElementById("stop");
    
    var startLocation;

    startButton.addEventListener('click', function(){
        getLocation("demo1", function(coords){
        	startLocation = coords;
        });
    });

    stopButton.addEventListener('click', function(){
        getLocation("demo2", function(coords){
        	var endLocation = coords;
        	
        	var speed = geolib.getSpeed(startLocation, endLocation);
        	var demo1 = document.getElementById("demo1");
        	demo1.innerHTML = speed + "km/h";
        	

        });
    });