package model.dto;

public class CashHistoryDTO {
		///DB ���ϸ��� �������� db table �߰� �ʿ� 
	private String id;
	private String itemName;
	private int mileage;
	private String saveDate;
	private int currentCash;
	
	public CashHistoryDTO(String id, String itemName, int mileage, String saveDate, int currentCash) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.mileage = mileage;
		this.saveDate = saveDate;
		this.currentCash = currentCash;
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
	public int getCurrentCash() {
		return currentCash;
	}
	public void setCurrentCash(int currentCash) {
		this.currentCash = currentCash;
	}
	
	
}
