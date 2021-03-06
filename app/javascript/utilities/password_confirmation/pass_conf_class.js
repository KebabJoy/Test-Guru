export default class PasswordConfirmation{
    constructor(form) {
        this.form                  = form
        this.password              = form.elements.user_password
        this.password_confirmation = form.elements.user_password_confirmation
        this.correct_icon          = form.querySelector('.correct')
        this.fail_icon             = form.querySelector('.incorrect')

        this.setup()
    }

    checkPassword(){
        if(this.password_confirmation.value === ''){
            this.fail_icon.classList.add('hide')
            this.correct_icon.classList.add('hide')
        }
        else if(this.password_confirmation.value === this.password.value){
            this.correct_icon.classList.remove('hide')
            this.fail_icon.classList.add('hide')
        } else{
            this.correct_icon.classList.add('hide')
            this.fail_icon.classList.remove('hide')
        }
    }

    setup(){
        this.form.addEventListener('input', event => {
            this.checkPassword()
        })
    }
}
