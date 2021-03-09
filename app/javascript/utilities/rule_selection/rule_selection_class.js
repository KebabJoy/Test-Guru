export default class RuleSelection{
    constructor(badge_form) {
        this.badge_form = badge_form
        this.badge_rule = badge_form.elements.badge_rule

        this.setup()
    }

    switchForm(event){
        this.level_select = document.querySelector('.level-selection')
        this.category_select = document.querySelector('.category-selection')

        if(this.badge_rule.value === "All Of Level"){
            this.level_select.classList.remove('hide')
            this.category_select.classList.add('hide')
        } else if(this.badge_rule.value === "All from Category"){
            this.level_select.classList.add('hide')
            this.category_select.classList.remove('hide')
        }
        else{
            this.level_select.classList.add('hide')
            this.category_select.classList.add('hide')
        }
    }

    setup(){
        this.badge_form.addEventListener('change', event => this.switchForm(event))

    }
}
