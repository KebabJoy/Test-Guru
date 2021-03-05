document.addEventListener('turbolinks:load',function (){
    let control = document.querySelector('.password_confirmation input[id=user_password_confirmation]')

    if(control) { control.addEventListener('input', passwordConfirmation)}
})

function passwordConfirmation(){

    let password = document.querySelector('.password input')
    let password_confirmation = document.querySelector('.password_confirmation input')
    let correct_icon = document.querySelector('.octicon-check-circle')
    let fail_icon = document.querySelector('.octicon-circle-slash')


    if (password_confirmation.value == ""){
        correct_icon.classList.add('hide')
        fail_icon.classList.add('hide')
    } else if(password.value == password_confirmation.value){
        correct_icon.classList.remove('hide')
        fail_icon.classList.add('hide')
    }else{
        correct_icon.classList.add('hide')
        fail_icon.classList.remove('hide')
    }
}
