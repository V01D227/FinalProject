package ph.com.cpi.model;

public class Product {
	
	private int productID;
	private String productName;
	private String productDesc;
	private String productPic;
	private String productStatus;
	private float price;

	public void setProductID(int productID) 	       {this.productID = productID;}
	public void setProductName(String productName)     {this.productName = productName;}
	public void setProductDesc(String productDesc)     {this.productDesc = productDesc;}
	public void setProductPic(String productPic)   	   {this.productPic = productPic;}
	public void setProductStatus(String productStatus) {this.productStatus = productStatus;}
	public void setPrice(float price) 				   {this.price = price;}
	
	
	public int getProductID() {
		return productID;
	}
	public String getProductName() {
		return productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public String getProductPic() {
		return productPic;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public float getPrice() {
		return price;
	}
}
