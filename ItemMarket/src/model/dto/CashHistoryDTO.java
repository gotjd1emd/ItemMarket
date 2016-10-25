package model.dto;

public class CashHistoryDTO {
		///DB 마일리지 충전내역 db table 추가 필요 
	private String id;
	private String itemName;
	private int mileage;
	private String saveDate;
	
	public CashHistoryDTO(String id, String itemName, int mileage, String saveDate) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.mileage = mileage;
		this.saveDate = saveDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}
	
	
}
