ready = -> $('.datepicker').datepicker()

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
