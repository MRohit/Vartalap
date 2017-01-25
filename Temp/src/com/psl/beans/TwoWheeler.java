package com.psl.beans;

public class TwoWheeler extends Vehicle {
	


	public TwoWheeler(int vehicleId, String make, String variant) {
		super(vehicleId, make);
		this.variant = variant;
	}

	public TwoWheeler() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String variant;

	public String getVariant() {
		return variant;
	}

	public void setVariant(String variant) {
		this.variant = variant;
	}
}
