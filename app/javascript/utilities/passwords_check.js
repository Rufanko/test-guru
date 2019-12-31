document.addEventListener('turbolinks:load', function() {
var control = document.getElementById('user_password_confirmation')

if (control) {control.addEventListener("input", checkpasswords)}
})

function checkpasswords() {
  var password = document.getElementById('user_password').value
  var password_confirmation = this.value

  if (password_confirmation.length == 0) {
    document.querySelector('.octicon-verified').classList.add('hide')
    document.querySelector('.octicon-unverified').classList.add('hide')
    return
  }

  if (password == password_confirmation) {
    document.querySelector('.octicon-verified').classList.remove('hide')
    document.querySelector('.octicon-unverified').classList.add('hide')
  } else {
    document.querySelector('.octicon-verified').classList.add('hide')
    document.querySelector('.octicon-unverified').classList.remove('hide')
  }
}
