const openModalButtons = document.querySelectorAll('[data-modal-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal = document.querySelector(button.dataset.modalTarget)
    openModal(modal)
  })
})

overlay.addEventListener('click', () => {
  const modals = document.querySelectorAll('.modal.active')
  	modals.forEach(modal => {
    closeModal(modal)
  })
})

closeModalButtons.forEach(button => {
  button.addEventListener('click', () => {
    const modal = button.closest('.modal')
    closeModal(modal)
  })
})

function openModal(modal) {
  if (modal == null) return
  modal.classList.add('active')
  overlay.classList.add('active')
}

function closeModal(modal) {
  if (modal == null) return
  modal.classList.remove('active')
  overlay.classList.remove('active')
}

var table = document.getElementById('table'),rIndex;
for(var i = 0; i < table.rows.length; i++){
	table.rows[i].onclick = function()
	{
		rIndex = this.rowsIndex;
		var picURL = this.cells[3].innerHTML;
		var price = this.cells[5].innerHTML
		var trimmedpicURL = picURL.replace('">', '');
		var trimmedpicURL2 = trimmedpicURL.replace('<img src="', '');
		
		console.log(trimmedpicURL2);
		
		document.getElementById("pidEdit").textContent = this.cells[0].innerHTML;
		document.getElementById("pnameEdit").value = this.cells[1].innerHTML;
		document.getElementById("pdescEdit").value = this.cells[2].innerHTML;
		document.getElementById("ppicEdit").value = trimmedpicURL2;
		document.getElementById("pstatusEdit").value = this.cells[4].innerHTML;
		document.getElementById("ppriceEdit").value = parseFloat(price);
		
	}
}
