document.addEventListener('turbolinks:load', function (){
   let bar = document.querySelector('.progress-bar')


   if(bar){
      const bardata = bar.dataset
      const progress = parseFloat(bardata.currentQuestionNumber) * 100 / parseFloat(bardata.questionsCount)

      bar.textContent = progress + '%'
      bar.style.width = progress + '%'
   }
})
