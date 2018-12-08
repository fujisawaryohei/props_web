// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('#music-panel').css('display','none');
  $('#modal-save').click(function(){
    var track_image = $('#music-panel-image').attr('src');
    var track_name = $('#track').text();
    var artist_name = $('#artist').text();
    $('.post-page .music-panel').css('display','block');
    $('#music-panel').css('display','flex');
    $('input[id="artist_field"]').val(artist_name);
    $('input[id="track_field"]').val(track_name);
    $('input[id="image_field"]').val(track_image);
  });
});
