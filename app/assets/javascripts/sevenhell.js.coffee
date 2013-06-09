window.app =
  counter: 0
  ready: ->
    $('#timer').hide()
    $('#start').click(app.go)

  go: ->
    $('#timer').show()
    console.log('start timer')
    app.timer = setInterval(app.increment_count, 1000)

  increment_count: ->
    console.log(app.counter)
    app.counter++
    $('.clock').text(app.counter)
    if app.counter is 5
      app.next_cycle()

  next_cycle: ->
    console.log('WHOOP!')
    app.counter = 0



$(document).ready(app.ready)