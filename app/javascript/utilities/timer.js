document.addEventListener('turbolinks:load', function (){
  const timer = document.querySelector('.timer')

  if(timer){
    let minutes = Math.floor(timer.dataset.timeLeft / 60)
    let seconds = Math.floor(timer.dataset.timeLeft % 60)
    setInterval(() => {

      seconds--
      if(seconds < 0){
        minutes--
        seconds = 59
      }
      if(minutes <= 0 && seconds <= 0){
        const send = document.querySelector('.submit')
        document.forms[2].submit()
      }

      timer.textContent = minutes + ':' + seconds
    }, 1000)
  }
})



