window.app =
  counter: 0
  exercise_index: 0
  ready: ->
    $('#timer').hide()
    $('#start').click(app.go)
    $('.exer1, .exer2').hide()

  go: ->
    $('#timer').show()
    console.log('start timer')
    app.timer = setInterval(app.increment_count, 1000)
    $('#start').hide()


  increment_count: ->
    console.log(app.counter)
    app.counter++
    $('.clock').text(app.counter)
    if app.counter is 5
      app.next_cycle()

  next_cycle: ->
    console.log('WHOOP!')
    app.counter = 0
    app.exercise_index++
    $('.exer' + (app.exercise_index - 1)).hide()
    $('.exer' + app.exercise_index).fadeIn()




$(document).ready(app.ready)