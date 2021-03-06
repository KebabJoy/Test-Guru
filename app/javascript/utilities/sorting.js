class SortingTable{
    constructor(control){
        this.control = control
        this.table = document.querySelector('table')
        this.rows = this.table.querySelectorAll('tr')
        this.sortedRows = []
        this.sortedTable = document.createElement('table')
        this.arrowUp = this.table.querySelector('.octicon-arrow-up')
        this.arrowDown = this.table.querySelector('.octicon-arrow-down')
        
        this.setup()
    }

    sortRowsByTitle(){
        if(this.arrowUp.classList.contains('hide')){
            this.sortedRows = Array.from(this.rows)
                .slice(1)
                .sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1);
            this.arrowDown.classList.add('hide')
            this.arrowUp.classList.remove('hide')
        } else{
            this.sortedRows = Array.from(this.rows)
                .slice(1)
                .sort((rowA, rowB) => rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1);
            this.arrowDown.classList.remove('hide')
            this.arrowUp.classList.add('hide')
        }

        this.sortedTable.classList.add('table')
        this.sortedTable.appendChild(this.rows[0])
        for (let i = 0; i < this.sortedRows.length; i++){
            this.sortedTable.appendChild(this.sortedRows[i])
        }
        this.table.parentNode.replaceChild(this.sortedTable, this.table)
    }

    setup(){
        this.control.addEventListener('click',event => {
            this.sortRowsByTitle()
        })
    }
}


document.addEventListener('turbolinks:load', function(){
    const control = document.querySelector('.sort-by-title')

    if (control) new SortingTable(control)
})




