package com.my.product.service;


import java.util.List;

import com.my.exception.SearchException;
import com.my.product.dao.ProductDAOOracle;
import com.my.product.vo.Product;

public class ProductService {
	public List<Product> findall() throws SearchException{
		ProductDAOOracle dao = new ProductDAOOracle();
		return dao.findall();
	}
	public Product findbyno(String prodno) throws SearchException {
		ProductDAOOracle dao = new ProductDAOOracle();
		return dao.findbyno(prodno);
	}
	
}
