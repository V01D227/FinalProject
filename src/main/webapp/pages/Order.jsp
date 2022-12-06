<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="jquery-2.2.4.js"></script>
<script>

function Add(){
		
	    addedRow = "<tr><td>" + Hello + "</td>" +
	    			"<td>There</td>" +
	    			"<td>friend</td>" +
	    			"<td>${product.price}</td></tr>";
       			       
        tableBody = $("table tbody");
        tableBody.append(addedRow);
    } 
}
</script>
<style>
    
    	h1 {
    		font-size: 25px;
    	}
    	
    	* {

			font-family: Helvetica;
			font-size: 17px;
		}
    	.text {
    		text-align: right;
    		padding-right: 10px;
    	}
    	
        table {
        	border: none;
            margin: 25px;
            width: 1000px;
        }
  
        th, td {
      		width: 250px;
            padding: 10px;
            text-align: center;
        }
  		th {
  			background-color: gray;
  		}
        table, td {
            border: 1px solid;
        }
        
        img {
        	width: 100px;
        	height: 100px;
        }
    </style>
    
<body>

	<table>
            <tr>
               <th>ID</th>
               <th>Name</th>
               <th>Description</th>
               <th>Picture</th>
               <th>Status</th>
               <th>Price</th>
            </tr>
            <tr>
            	<td>${product.productID}</td>
            	<td>${product.productName}</td>
            	<td>${product.productDesc}</td>
            	<td><img src="${product.productPic}"></td>
            	<td>${product.productStatus}</td>
            	<td>${product.price}</td>
            </tr>
       
    </table>
</body>
</html>