package com.ssafy.jdbctest;

import java.util.List;

public class ProductMain {
	public static void main(String[] args) {
		int n = Integer.parseInt(args[0]);
		if(n == 1) new ProductMain().searchAll();
		else if(n == 2) new ProductMain().insertProduct("G123410", "갤럭시S10", 2980000, "사용하기편리함");
		else if(n == 3) new ProductMain().updateProduct("G123410", 3000000, "가격오름");
		else if(n == 4) new ProductMain().deleteProduct("G123410");
		
		//new ProductMain().searchAll();
	}
	
	public void searchAll() {
		List<ProductDto> list=ProductDaoImpl.getProductDao().searchAll();
		showList(list);
	}
	public void insertProduct(String productId, String productName, int productPrice, String productDesc) {
		int n = ProductDaoImpl.getProductDao().insertProduct(productId, productName, productPrice, productDesc);
		System.out.println(n+"개 데이터가 저장되었습니다.");
		searchAll();
	}
	public void updateProduct(String productId, int productPrice, String productDesc ) {
		int n =ProductDaoImpl.getProductDao().updateProduct(productId, productPrice, productDesc);
		System.out.println(n+"개 데이터가 수정되었습니다.");
		searchAll();
	}
	public void deleteProduct(String ProductId) {
		int n=ProductDaoImpl.getProductDao().deleteProduct(ProductId);
		System.out.println(n+"개 데이터가 삭제되었습니다.");
		searchAll();
	}
	
	public void showList(List<ProductDto> list) {
		System.out.println("===================================== 상품 목록 =====================================");
		System.out.println("상품아이디\t상품이름\t\t상품가격\t상품설명\t\t등록일");
		System.out.println("-------------------------------------------------------------------------------------");
		for(ProductDto productDto : list) {
			System.out.println(productDto);
		}
		System.out.println("-------------------------------------------------------------------------------------");
	}
}
	