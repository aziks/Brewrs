// CREATE MARKERS ON MAP

   var addresses = document.getElementsByClassName('get_address') 
   var lati = document.getElementsByClassName('hidden_lat');
   var longi = document.getElementsByClassName('hidden_lng');
   console.log(lati);
   console.log(longi);
   console.log(addresses);

   for (var i=lati.length-1; i>=0; i--){  
  console.log('test');
    isNaN(parseFloat(lati[i].innerText)) ? latitud=40.4260577 : latitud=parseFloat(lati[i].innerText)
    isNaN(parseFloat(longi[i].innerText)) ? longitud=-3.7556513 : longitud=parseFloat(longi[i].innerText)

     var Position = {
       lat: latitud,
       lng: longitud
     };

console.log(Position);
     //Markers
     showMarkers(Position);  
}


// PREVIEW UPLOAD IMAGE

$(function() {
  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#target').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});