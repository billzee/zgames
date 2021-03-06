$(document).ready ->
  $("#game_price").mask("#.##0,00", {reverse: true});
  $("#game_price_with_manual").mask("#.##0,00", {reverse: true});
  $("#game_available").bootstrapSwitch(onText: "SIM", offText: "NÃO", onColor: "success", offColor: "danger");
  $("#game_translated").bootstrapSwitch(onText: "SIM", offText: "NÃO", onColor: "success", offColor: "danger");

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader()

      reader.onload = (e) ->
        $('#game_image_tag').attr('src', e.target.result)
      reader.readAsDataURL(input.files[0])

  $("#game_image").change (e) ->
    readURL(this)

  return
