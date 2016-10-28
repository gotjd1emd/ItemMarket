package model.dto;



public class BorderDTO {
	private String id; 
	private int borderNumber;
	private String content;
	private String itemName;
	private int money;
	private String dayDate;
	private String category;
	private String subcategory;
	private String itemState;
	
	public BorderDTO() {
		super();
	}
	public BorderDTO(String id, String content, String itemName, int money, String dayDate, String category,
			String subcategory, String itemState) {
		super();
		this.id = id;
		this.content = content;
		this.itemName = itemName;
		this.money = money;
		this.dayDate = dayDate;
		this.category = category;
		this.subcategory = subcategory;
		this.itemState = itemState;
	}

	public BorderDTO(String id, int borderNumber, String content, String itemName, int money, String dayDate,
			String category, String subcategory, String itemState) {
		super();
		this.id = id;
		this.borderNumber = borderNumber;
		this.content = content;
		this.itemName = itemName;
		this.money = money;
		this.dayDate = dayDate;
		this.category = category;
		this.subcategory = subcategory;
		this.itemState = itemState;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBorderNumber() {
		return borderNumber;
	}

	public void setBorderNumber(int borderNumber) {
		this.borderNumber = borderNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getDayDate() {
		return dayDate;
	}

	public void setDayDate(String dayDate) {
		this.dayDate = dayDate;
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

	public String getItemState() {
		return itemState;
	}

	public void setItemState(String itemState) {
		this.itemState = itemState;
	}
	
	
	
	
}

