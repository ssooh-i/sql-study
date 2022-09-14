package com.ssafy.jdbctest;

import java.util.List;

public interface ProductDao {
	public List<ProductDto> searchAll();

	public int insertProduct(String productId, String productName, int productPrice, String productDesc);

	public int updateProduct(String productId, int productPrice, String productDesc);

	public int deleteProduct(String ProductId);
}
