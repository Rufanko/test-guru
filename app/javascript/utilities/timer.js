document.addEventListener('turbolinks:load', function() {
  let timer = document.getElementById('timer')

  if (timer) { changeTimer(timer) }
})


function changeTimer(timer) {
    let testCreated = timer.dataset.testCreated,
        timeTest = timer.dataset.timeTest,
        timeNow = Math.trunc(Date.now() / 1000).toFixed(),
        passedTime = timeNow - testCreated

    if (passedTime > timeTest) {
        document.querySelector('.passage-form').submit()
        return
    }
    var hours   = Math.trunc(passedTime / 3600)
    var minutes = Math.trunc((passedTime - (hours * 3600)) / 60)
    var seconds = passedTime - (hours * 3600) - (minutes * 60)

    if (seconds < 10) { seconds = '0' + seconds }

    if (minutes < 10) { minutes = '0' + minutes }

    if (hours < 10) { hours = '0' + hours }

    timer.textContent = hours + ':' + minutes + ':' + seconds

    setTimeout(changeTimer, 1000, timer);
}
