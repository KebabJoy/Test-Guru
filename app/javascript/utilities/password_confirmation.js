document.addEventListener('turbolinks:load',function (){
    var control = document.querySelector('.password_confirmation input[id=user_password_confirmation]')

    if(control) { control.addEventListener('input', passwordConfirmation)}
})

function passwordConfirmation(){

    var password = document.querySelector('.password input')
    var password_confirmation = document.querySelector('.password_confirmation input')
    var correct_icon = document.querySelector('.octicon-check-circle')
    var fail_icon = document.querySelector('.octicon-circle-slash')
    console.log(password.value)
    console.log(password_confirmation.value)

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
