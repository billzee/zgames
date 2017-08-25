# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Number::formatMoney = (t=',', d='.', c='$') ->
  n = this
  s = if n < 0 then "-#{c}" else c
  i = Math.abs(n).toFixed(2)
  j = (if (j = i.length) > 3 then j % 3 else 0)
  s += i.substr(0, j) + t if j
  return s + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t)


$('#vote_pick1_id').formatMoney
