document.addEventListener('turbolinks:load',function (){
    const badges = document.querySelectorAll('.achievement')

    if(badges){
        badges.forEach(element => {
            if(element.dataset.achieved == "true"){
                element.classList.add('not-achieved')
            }
        })
    }
})
