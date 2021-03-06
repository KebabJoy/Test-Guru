document.addEventListener('turbolinks:load', function(){
    const controls = $('.form-inline-link')

    if(controls) { new window.FormHandler(controls)}
})
