package model.dto;

public class TradeHistoryDTO {
	//������ŷ��� trading 
	private String buyer;
	private String seller;
	private String itemName;
	private int cash;
	private int borderNumber;
	private String dayDate;
	private String tradeState;
	
	public TradeHistoryDTO(String buyer, String seller, int cash, int borderNumber, String tradeState) {
		this.buyer = buyer;
		this.seller = seller;
		this.cash = cash;
		this.borderNumber = borderNumber;
		this.tradeState = tradeState;
	}
	
	public TradeHistoryDTO(String buyer, String seller, String itemName, int cash, int borderNumber, String tradeState) {
		super();
		this.buyer = buyer;
		this.seller = seller;
		this.itemName = itemName;
		this.cash = cash;
		this.borderNumber = borderNumber;
		this.tradeState = tradeState;
	}

	public TradeHistoryDTO(String buyer, String seller, String itemName, int cash, int borderNumber, String dayDate, String tradeState) {
		super();
		this.buyer = buyer;
		this.seller = seller;
		this.itemName = itemName;
		this.cash = cash;
		this.borderNumber = borderNumber;
		this.dayDate = dayDate;
		this.tradeState = tradeState;
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getBorderNumber() {
		return borderNumber;
	}

	public void setBorderNumber(int borderNumber) {
		this.borderNumber = borderNumber;
	}

	public String getDayDate() {
		return dayDate;
	}

	public void setDayDate(String dayDate) {
		this.dayDate = dayDate;
	}
	 
	public String getTradeState() {
		return tradeState;
	}

	public void setTradeState(String tradeState) {
		this.tradeState = tradeState;
	}
}
