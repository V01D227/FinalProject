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
		
		document.getElementById("uid").textContent = this.cells[0].innerHTML;
		document.getElementById("uname").value = this.cells[1].innerHTML;
		document.getElementById("emailEdit").value = this.cells[2].innerHTML;
		document.getElementById("roleEdit").value = this.cells[3].innerHTML;
		
	}
}
