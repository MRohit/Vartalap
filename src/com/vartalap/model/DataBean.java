package com.vartalap.model;

public class DataBean {
	String value;
	String data;
	
	
	public DataBean(String value, String data) {
		super();
		this.value = value;
		this.data = data;
	}

	public DataBean() {
		super();
	}

	public String getData() {
		return data;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setData(String data) {
		this.data = data;
	}
}
