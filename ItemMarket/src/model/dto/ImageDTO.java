package model.dto;

public class ImageDTO {
	private int borderNumber;
	private String img;
	

	public ImageDTO() {
		super();
	}

	public ImageDTO(int borderNumber, String img) {
		super();
		this.borderNumber = borderNumber;
		this.img = img;
	}
	
	public int getBorderNumber() {
		return borderNumber;
	}


	public void setBorderNumber(int borderNumber) {
		this.borderNumber = borderNumber;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}

	
	
}
