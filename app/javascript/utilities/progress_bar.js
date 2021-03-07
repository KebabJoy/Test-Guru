document.addEventListener('turbolinks:load', function (){
   let bar = document.querySelector('.progress-bar')


   if(bar){
      const bar_data = bar.dataset
      const progress = parseFloat(bar_data.currentQuestionNumber) * 100 / parseFloat(bar_data.questionsCount)

      bar.textContent = progress + '%'
      bar.style.width = progress + '%'
   }
})
