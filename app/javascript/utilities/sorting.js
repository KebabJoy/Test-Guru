document.addEventListener('turbolinks:load', function(){
    const control = document.querySelector('.sort-by-title')

    if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle(){
    const table = document.querySelector('table')

    // NodeList
    const rows = table.querySelectorAll('tr')
    let sortedRows = []
    const sortedTable = document.createElement('table')
    
    if(this.querySelector('.octicon-arrow-up').classList.contains('hide')){
        sortedRows = Array.from(table.rows)
            .slice(1)
            .sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1);
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else{
        sortedRows = Array.from(table.rows)
            .slice(1)
            .sort((rowA, rowB) => rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1);
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++){
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}
