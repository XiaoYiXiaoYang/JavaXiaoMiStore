package com.xiaomi.dao.vo;

public class Good {
	private int good_id;
	private String good_name;   //商品名称
	private double good_price;  //商品价格
	private String good_type;   //类型
	private String good_color;  //颜色
	private int good_count;     //数量
	private String good_img;    //图片
	private String good_desc;   //描述
	
	
	public Good(){  }
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public double getGood_price() {
		return good_price;
	}
	public void setGood_price(double good_price) {
		this.good_price = good_price;
	}
	public String getGood_type() {
		return good_type;
	}
	public void setGood_type(String good_type) {
		this.good_type = good_type;
	}
	public String getGood_color() {
		return good_color;
	}
	public void setGood_color(String good_color) {
		this.good_color = good_color;
	}
	public int getGood_count() {
		return good_count;
	}
	public void setGood_count(int good_count) {
		this.good_count = good_count;
	}
	public String getGood_img() {
		return good_img;
	}
	public void setGood_img(String good_img) {
		this.good_img = good_img;
	}
	public String getGood_desc() {
		return good_desc;
	}
	public void setGood_desc(String good_desc) {
		this.good_desc = good_desc;
	}
	
}
