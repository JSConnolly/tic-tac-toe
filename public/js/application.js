$(document).ready(function() {

  $('.game_board td').on('click', function(e) {
    // alert(this);
    $('.game_board td').off('click');
    $(this).html('<span class="x">X</span>');

  });

});