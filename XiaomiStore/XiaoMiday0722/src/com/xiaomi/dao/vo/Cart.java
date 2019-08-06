package com.xiaomi.dao.vo;

public class Cart {
	private int pre_id;
	private int uid;
	private int good_id;
	private int good_num;   //商品数量
	private int status;     //商品状态
	private double price;   //小计
	
	private Good g; 
	
	public Good getG() {
		return g;
	}

	public void setG(Good g) {
		this.g = g;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Cart(){  }
	
	public int getPre_id() {
		return pre_id;
	}
	public void setPre_id(int pre_id) {
		this.pre_id = pre_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public int getGood_num() {
		return good_num;
	}
	public void setGood_num(int good_num) {
		this.good_num = good_num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
