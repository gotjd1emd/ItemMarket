package model.dto;

public class HistoryDTO {
	private int money;
	private String daydate;
	private String buyer;
	private String seller;
	private String category;
	private String subcategory;
	public HistoryDTO() {
		// TODO Auto-generated constructor stub
	}
	public HistoryDTO(int money, String daydate, String buyer, String seller, String category, String subcategory) {
		super();
		this.money = money;
		this.daydate = daydate;
		this.buyer = buyer;
		this.seller = seller;
		this.category = category;
		this.subcategory = subcategory;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getDaydate() {
		return daydate;
	}
	public void setDaydate(String daydate) {
		this.daydate = daydate;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
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
	
	
	
}
