package com.application.util;

import com.application.bean.Page;

public class PageUtil {
	public static Page createPage(int pageSize,int totalCount,int currentPage) {
		pageSize = getPageSize(pageSize);
		currentPage = getCurrentPage(currentPage);
		int totalPage = getTotalPage(pageSize, totalCount);
		int beginIndex = getBeginIndex(pageSize, currentPage);
		int endIndex = beginIndex+pageSize;
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(totalPage, currentPage);
		return new Page(pageSize, totalCount, totalPage, currentPage,
				beginIndex, endIndex, hasPrePage,  hasNextPage);
	}
	
	public static Page createPage(Page page,int totalCount) {
		int pageSize = getPageSize(page.getPageSize());
		int currentPage = getCurrentPage(page.getCurrentPage());
		int totalPage = getTotalPage(pageSize, totalCount);
		int beginIndex = getBeginIndex(pageSize, currentPage);
		int endIndex = beginIndex+pageSize;
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(totalPage, currentPage);
		return new Page(pageSize, totalCount, totalPage, currentPage,
				beginIndex, endIndex,hasPrePage,  hasNextPage);
	}
	
	//设置每页显示记录�?
	public static int getPageSize(int pageSize) {
		return pageSize == 0 ? 10 : pageSize;
	}
	
	//设置当前�?
	public static int getCurrentPage(int currentPage) {
		return currentPage == 0 ? 1 : currentPage;
	}
	
	//设置总页�?,�?要�?�记录数，每页显示多�?
	public static int getTotalPage(int pageSize,int totalCount) {
		int totalPage = 0;
		if(totalCount % pageSize == 0) {
			totalPage = totalCount / pageSize;
		} else {
			totalPage = totalCount / pageSize + 1;
		}
		return totalPage;
	}
	
	//设置起始点，�?要每页显示多少，当前�?
	public static int getBeginIndex(int pageSize,int currentPage) {
		return (currentPage - 1) * pageSize;
	}
	
	//设置是否有上�?页，�?要当前页
	public static boolean getHasPrePage(int currentPage) {
		return currentPage == 1 ? false : true;
	}
	
	//设置是否有下�?个，�?要�?�页数和当前�?
	public static boolean getHasNextPage(int totalPage, int currentPage) {
		return currentPage == totalPage || totalPage == 0 ? false : true;
	}
}
