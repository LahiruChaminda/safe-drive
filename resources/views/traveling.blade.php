@extends('layouts.app')

@section('content')
    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
    <div class="container">
        <div class="collapse navbar-collapse" id="app-navbar-collapse">
            <!-- Left Side Of Navbar -->
            <ul class="nav navbar-nav">
                &nbsp;
                <li><a href="{{ url('/user') }}">Users</a></li>
                &nbsp;
                <li><a href="{{ url('/traveling') }}">Traveling</a></li>
                &nbsp;
                <li><a href="{{ url('/collision') }}">Collisions</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">Traveling Report</div>

                    <div class="panel-body">
                        <div id="map"></div>
                        <script>

                            function initMap(locations) {

                                var bounds = new google.maps.LatLngBounds();
                                var infowindow = new google.maps.InfoWindow();

                                var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 10,
                                    center: new google.maps.LatLng(6.9271, 79.8612),
                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                });


                                var marker, i;

                                for (i = 0; i < locations.length; i++) {
                                    console.log(locations[i][1]);
                                    marker = new google.maps.Marker({
                                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                        map: map
                                    });

                                    bounds.extend(marker.position);

                                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                        return function () {
                                            infowindow.setContent(locations[i][0]);
                                            infowindow.open(map, marker);
                                        }
                                    })(marker, i));
                                }

                                //now fit the map to the newly inclusive bounds
                                map.fitBounds(bounds);

                            }


                            function mapLocations() {
                                $.ajax({
                                    url: "{{$locationsUrl}}",
                                    dataType: "json",
                                    success: function (result) {
                                        if (result.locations.length) {
                                            initMap(result.locations);
                                        }
                                    }
                                });
                            }

                            //setInterval(function(){ mapLocations(); }, 1000);
                        </script>
                        <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBU4_ywIZo6V9jFI0xhybjoVl7gQBCI9vQ&callback=mapLocations">
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection