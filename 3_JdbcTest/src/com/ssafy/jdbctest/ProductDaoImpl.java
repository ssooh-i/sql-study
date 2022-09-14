package com.ssafy.jdbctest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.jdbctest.util.DBClose;
import com.ssafy.jdbctest.util.DBConnection;

public class ProductDaoImpl implements ProductDao {
	private static ProductDao productDao;

	private ProductDaoImpl() {
	}

	public static ProductDao getProductDao() {// 싱글톤패턴
		if (productDao == null) {
			productDao = new ProductDaoImpl();
		}
		return productDao;
	}

	@Override
	public List<ProductDto> searchAll() {
		List<ProductDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select product_id, product_name, product_price, product_desc, ");
			sql.append("date_format(register_date, '%y.%m.%d') register_date \n");
			sql.append("from product");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDto productDto = new ProductDto();
				productDto.setProductId(rs.getString("product_id"));
				productDto.setProductName(rs.getString("product_name"));
				productDto.setProductPrice(rs.getInt("product_price"));
				productDto.setProductDesc(rs.getString("product_desc"));
				productDto.setRegisterDate(rs.getString("register_date"));

				list.add(productDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertProduct(String productId, String productName, int productPrice, String productDesc) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into product(product_id, product_name, product_price, product_desc) ");
			sql.append(" values(?,?,?,?)");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, productId);
			pstmt.setString(2, productName);
			pstmt.setInt(3, productPrice);
			pstmt.setString(4, productDesc);
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateProduct(String productId, int productPrice, String productDesc) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update product set product_price=?, product_desc=? where product_id=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, productPrice);
			pstmt.setString(2, productDesc);
			pstmt.setString(3, productId);
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int deleteProduct(String productId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn = DBConnection.getConnection();

			String sql = "delete from product where product_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {

		}
		return cnt;
	}
}
