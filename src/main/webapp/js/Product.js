
function Add(){
	
		var name = '${product.productName}';
		
		addedRow = "<tr><td>" + name + "</td>" +
	 	   				"<td>" + name + "</td>" +
	 	   				"<td>" + name + "</td>" +
	       				"<td>" + name + "</td></tr>";
       			       
        tableBody = $("table tbody");
        tableBody.append(addedRow);
    
}