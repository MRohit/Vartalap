package com.psl.beans;

public class FourWheeler extends Vehicle {
	

	public FourWheeler(int vehicleId, String make, String color) {
		super(vehicleId, make);
		this.color = color;
	}

	public FourWheeler() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String color;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
