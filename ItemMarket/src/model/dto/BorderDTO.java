package model.dto;



public class BorderDTO {
	private String id; 
	private String borderNumber;
	private String content;
	private int money;
	private String date;
	private String imgName;

	private String category;
	private String subcategory;
	
	public BorderDTO(String id, String borderNumber, String content, int money, String date, String imgName,
			String category, String subcategory) {
		super();
		this.id = id;
		this.borderNumber = borderNumber;
		this.content = content;
		this.money = money;
		this.date = date;
		this.imgName = imgName;
		this.category = category;
		this.subcategory = subcategory;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBorderNumber() {
		return borderNumber;
	}

	public void setBorderNumber(String borderNumber) {
		this.borderNumber = borderNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
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

