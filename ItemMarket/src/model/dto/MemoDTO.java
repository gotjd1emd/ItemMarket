package model.dto;

public class MemoDTO {
	// table Á¤º¸ messenger
	private String sender;
	private String receiver;
	private String content;
	private String daydate;
	public MemoDTO(String sender, String receiver, String content, String daydate) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.daydate = daydate;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDaydate() {
		return daydate;
	}
	public void setDaydate(String daydate) {
		this.daydate = daydate;
	}
	
	
}
