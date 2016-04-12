$( document ).ready(function() {

var map;


  if ($('#show_locations_map').length > 0) {

  function getshowingMarkers(){

    var lati = document.getElementsByClassName('hidden_lat');
    var longi = document.getElementsByClassName('hidden_lng');


   for (var i=lati.length-1; i>=0; i--){  
     isNaN(parseFloat(lati[i].innerText)) ? latitud=40.4260577 : latitude=parseFloat(lati[i].innerText)
     isNaN(parseFloat(longi[i].innerText)) ? longitud=-3.7556513 : longitude=parseFloat(longi[i].innerText)

     // var lati = $('.hidden_lat').attr('value');
     // var longi = $('.hidden_lng').attr('value');

     var latlng = {
      lat: latitude, 
      lng: longitude
      };

    createMarker(latlng);
      
      }

  };

  console.log("showing locations");
  function initMap() {

    map = new google.maps.Map(document.getElementById('show_locations_map'), {
      zoom: 10,
      center: {lat: 40.4381311, lng: -3.8196227}
    });
    
  }

    function createMarker(latlng){

      var marker = new google.maps.Marker({
        position: latlng,
        map: map
      });

    }

  initMap();
  getshowingMarkers();

  }

});


$('.like_beer').bind('ajax:success', function(){
  console.log("like");
   $(this).parent().parent().find('.vote_count').html('<%= escape_javascript @beer.get_likes.size %>');
   $(this).closest('.like_beer').hide();
   $(this).closest('.votes').html(' <%= link_to "Unlike", unlike_beer_path(@beer), remote: true, method: :get, class: "unlike_beer" %>');
});

$('.unlike_beer').bind('ajax:success', function(){
   $(this).parent().parent().find('.vote_count').html('<%= escape_javascript @beer.votes_for.size.to_s %>');
   $(this).closest('.unlike_beer').hide();
   $(this).closest('.votes').html(' <%= link_to "Like", like_beer_path(@beer), remote: true, method: :get, class: "like_beer" %>');

});