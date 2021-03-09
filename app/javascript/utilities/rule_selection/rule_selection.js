document.addEventListener('turbolinks:load', function (){
    const badge_form = document.getElementById('new_badge')

    if(badge_form) { new window.RuleSelection(badge_form) }
})
