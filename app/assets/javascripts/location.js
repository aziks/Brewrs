$( document ).ready(function() {

  if ($('#get_location_map').length > 0){
  
  console.log( "Map is ready!" );

  var map;
        
  function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 40.4381311, lng: -3.8196227},
      zoom: 10
    });
  }

  function setupAutocomplete(){
    var input = $('#get-places')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.addListener('place_changed', function(){
      var place = autocomplete.getPlace();
          console.log(place.adr_address);

        if (place.geometry.location) {
          map.setCenter(place.geometry.location);
          map.setZoom(17);
        } else {
          alert("The place has no location...?")
        }

      $('#show_address').append('<div class="box">' + place.adr_address + '</div>');
      $('#direction').val(place.adr_address);

      createMarker(place.geometry.location);

    });
  }


  function createMarker(position) {
      var marker = new google.maps.Marker({
       position: position,
       map: map
     });


      console.log(marker);
      $('#lat').val(marker.position.lat());
      $('#lng').val(marker.position.lng());
      
  }

  initMap();
  setupAutocomplete();

}

});

