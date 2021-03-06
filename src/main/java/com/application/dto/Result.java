package com.application.dto;

import java.io.Serializable;

public class Result implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4434862701561829579L;
	private String message;
	private int code;
	private Object data;
	private String url;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public static Result success(int code,String message,Object data,String url) {
		Result res= new Result();
		res.setCode(code);
		res.setData(data);
		res.setMessage(message);
		res.setUrl(url);
		return res;
	}
	public static Result success(int code,String message,Object data) {
		Result res= new Result();
		res.setCode(code);
		res.setData(data);
		res.setMessage(message);
		res.setUrl("");
		return res;
	}
	public static Result success(int code,String message) {
		Result res= new Result();
		res.setCode(code);
		res.setMessage(message);
		res.setUrl("");
		return res;
	}
	public static Result failure(int code,String message) {
		Result res= new Result();
		res.setCode(code);
		res.setMessage(message);
		res.setUrl("");
		return res;
	}
	/**
	 * 
	 * @param message code:1(default)
	 * @return
	 */
	public static Result success(String message) {
		Result res= new Result();
		res.setCode(1);
		res.setMessage(message);
		res.setUrl("");
		return res;
	}
	/**
	 * 
	 * @param message code:0(default)
	 * @return
	 */
	public static Result failure(String message) {
		Result res= new Result();
		res.setCode(0);
		res.setMessage(message);
		res.setUrl("");
		return res;
	}
}
