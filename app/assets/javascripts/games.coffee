# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  console.log "ready"
  $("#game_price").mask("#.##0,00", {reverse: true});
  $("#game_price_with_manual").mask("#.##0,00", {reverse: true});
  $("#game_is_available").bootstrapSwitch();
