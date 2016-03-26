// CREATE MARKERS ON MAP

$( document ).ready(function() {
    console.log( "Show locations in map!!" );

    // $(function(){
    //   position
    // })

});


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