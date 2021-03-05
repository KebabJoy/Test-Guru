document.addEventListener('turbolinks:load', function(){
    let control = document.querySelector('.sort-by-title')

    if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle(){
    let table = document.querySelector('table')

    // NodeList
    let rows = table.querySelectorAll('tr')
    let sortedRows = []

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

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++){
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}
