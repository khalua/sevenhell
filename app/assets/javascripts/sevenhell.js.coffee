window.app =
  counter: 0
  exercise_index: 0
  ready: ->
    $('#timer').hide()
    $('#start').click(app.go_exercise)
    $('[class^="exer"]').hide()
    $('#finished').hide()

  go_exercise: ->
    $('#timer').show()
    console.log('start exercise timer')
    app.exercise_incrementer = setInterval(app.exercise_timer, 1000)
    $('#start').hide()

  exercise_timer: ->
    $('#exercises').show()
    if app.exercise_index is 0
      app.exercise_index++
    $('.exer' + (app.exercise_index - 1)).hide()
    $('.exer' + app.exercise_index).fadeIn()
    console.log('exercise ' + app.counter)
    app.counter++
    $('.clock').text(app.counter)
    $('.type').text('Exercise!')
    if app.counter is 1 # exercise timer in seconds
      app.exercise_index++
      clearInterval(app.exercise_incrementer)
      app.counter = 0
      app.go_rest()

  go_rest: ->
    console.log('start rest timer')
    app.rest_incrementer = setInterval(app.rest_timer, 1000)

  rest_timer: ->
    if app.exercise_index is 18 #18 for prod
      app.finished()
    else
      console.log('rest ' + app.counter)
      app.counter++
      $('.clock').text(app.counter)
      $('.type').text('Rest')
      $('#exercises').fadeOut()
      if app.counter is 1 # rest timer in seconds
        clearInterval(app.rest_incrementer)
        app.counter = 0
        app.next_exercise()

  next_exercise: ->
    app.go_exercise()

  finished: ->
    $('#exercises').fadeOut()
    $('#finished').fadeIn()
    $('#timer').fadeOut()
    clearInterval(app.rest_incrementer)
    clearInterval(app.exercise_incrementer)



$(document).ready(app.ready)