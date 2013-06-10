window.app =
  counter: 0
  exercise_index: 0
  ready: ->
    $('#timer').hide()
    $('#start').click(app.go_exercise)
    $('.exer1, .exer2').hide()

  go_exercise: ->
    $('#timer').show()
    console.log('start exercise timer')
    app.exercise_incrementer = setInterval(app.exercise_timer, 1000)
    $('#start').hide()


  exercise_timer: ->
    console.log('exercise ' + app.counter)
    app.counter++
    $('.clock').text(app.counter)
    $('.type').text('Exercise!')
    if app.counter is 10
      app.exercise_index++
      clearInterval(app.exercise_incrementer)
      app.counter = 0
      app.go_rest()

  go_rest: ->
    console.log('start rest timer')
    app.rest_incrementer = setInterval(app.rest_timer, 1000)

  rest_timer: ->
    console.log('rest ' + app.counter)
    app.counter++
    $('.clock').text(app.counter)
    $('.type').text('Rest')
    if app.counter is 5
      clearInterval(app.rest_incrementer)
      app.counter = 0
      app.next_exercise()

  next_exercise: ->
    $('.exer' + (app.exercise_index - 1)).hide()
    $('.exer' + app.exercise_index).fadeIn()
    app.go_exercise()



$(document).ready(app.ready)