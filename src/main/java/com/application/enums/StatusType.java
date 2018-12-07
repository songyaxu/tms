package com.application.enums;

public enum StatusType {
	SUCCESS(1,"成功"),
	FAILURE(0, "失败");
	
	private Integer code;
	
	private String value;
	
	private StatusType(Integer code, String value) {
		this.code = code;
		this.value = value;
	}
	
	public static String getValue(Integer code) {
		if (code == null) {
			return "";
		}
		for (StatusType typeEnum : StatusType.values()) {
			if (typeEnum.code == code) {
				return typeEnum.value;
			}
		}
		return "";
	}
	
	public Integer getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}
}
