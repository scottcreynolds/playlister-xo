$(document).ready(function() {
  $("#make_songs").on("click", function(){
    $.get('/songs/makesome', function(data){
      $("#song_list_partial").html(data);
    });
  });
});