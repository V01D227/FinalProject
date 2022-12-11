let dbToggle = document.querySelector('.dbToggle');
let dbSidebar = document.querySelector('.dbSidebar');
let dbMain = document.querySelector('.dbMain');

dbToggle.onclick = function() {
	dbSidebar.classList.toggle('active');
	dbMain.classList.toggle('active');
}
//hovering Menus
let list = document.querySelectorAll('.db-sidebar li');
function activeLink() {
	list.forEach((item) =>
	item.classList.remove('hovered'));
	this.classList.add('hovered');			
}
list.forEach((item) =>
item.addEventListener('mouseover',activeLink));