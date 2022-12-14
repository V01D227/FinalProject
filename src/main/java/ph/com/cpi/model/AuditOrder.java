package ph.com.cpi.model;

public class AuditOrder {
	
	private int itemChangeID;
	private String username;
	private String itemID;
	private String fieldChanged;
	private String oldValue;
	private String newValue;
	private String changeDate;
	
	public int getItemChangeID() {
		return itemChangeID;
	}
	public void setItemChangeID(int itemChangeID) {
		this.itemChangeID = itemChangeID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	public String getFieldChanged() {
		return fieldChanged;
	}
	public void setFieldChanged(String fieldChanged) {
		this.fieldChanged = fieldChanged;
	}
	public String getOldValue() {
		return oldValue;
	}
	public void setOldValue(String oldValue) {
		this.oldValue = oldValue;
	}
	public String getNewValue() {
		return newValue;
	}
	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	
}
