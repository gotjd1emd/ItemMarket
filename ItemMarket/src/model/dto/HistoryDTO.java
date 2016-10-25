package model.dto;

public class HistoryDTO {
	private String daydate;
	private String seller;
	private String buyer;
	private String category;
	private String subcategory;
	private String itemName;
	private int money;
	
	public HistoryDTO(String daydate, String seller, String buyer, String category, String subcategory, String itemName,
			int money) {
		super();
		this.daydate = daydate;
		this.seller = seller;
		this.buyer = buyer;
		this.category = category;
		this.subcategory = subcategory;
		this.itemName = itemName;
		this.money = money;
	}

	public String getDaydate() {
		return daydate;
	}

	public void setDaydate(String daydate) {
		this.daydate = daydate;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	
	
}
