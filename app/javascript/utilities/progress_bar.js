document.addEventListener('turbolinks:load', function() {
var control = document.querySelector('.current-progress')

  var current_question = control.dataset.currentquestion
  var totalQuestions = document.querySelector('.progress-bar').dataset.totalQuestions
  console.log(current_question)
  console.log(totalQuestions)

  if (current_question > 1) {
    var width = (current_question - 1)/totalQuestions * 100
    control.style.width = width +'%'
}
})
