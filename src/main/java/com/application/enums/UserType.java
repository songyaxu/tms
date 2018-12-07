package com.application.enums;

public enum UserType {
	STUDENT(0,"student"),
	TEACHER(1, "teacher");
	
	private Integer code;
	
	private String value;
	
	private UserType(Integer code, String value) {
		this.code = code;
		this.value = value;
	}
	
	public static String getValue(Integer code) {
		if (code == null) {
			return "";
		}
		for (UserType userTypeEnum : UserType.values()) {
			if (userTypeEnum.code == code) {
				return userTypeEnum.value;
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
