export default class FormHandler{
    constructor(controls) {
        this.controls = controls
        this.errors = $('.resource-errors')

        this.setup()
    }

    formInlineHandler(){
        this.link = document.querySelector('.form-inline-link[data-test-id="' + this.testId + '"]')
        if(this.link != null) {
            this.$testTitle = $('.test-title[data-test-id="' + this.testId + '"]')
            this.$formInline = $('.form-inline[data-test-id="' + this.testId + '"]')

            this.$testTitle.toggle()
            this.$formInline.toggle()

            if (this.$formInline.is(':visible')) {
                this.link.textContent = 'Cancel'
            } else {
                this.link.textContent = 'Edit'
            }
        }
    }

    formInlineLinkHandler(event){
        event.preventDefault()

        this.testId = event.target.dataset.testId

        this.formInlineHandler()
    }

    setup(){
        this.controls.on('click', event => {
            this.formInlineLinkHandler(event)
        })

        if(this.errors){
            this.testId = this.errors.data.resourceId
            this.formInlineHandler()
        }

    }
}
