package com.my.product.control;

import java.io.IOException;

import com.my.exception.SearchException;
import com.my.product.service.ProductService;
import com.my.product.vo.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class productdetailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodno = request.getParameter("prodno");
		ProductService service = new ProductService();
		String path="";
		
		try {
			Product p = service.findbyno(prodno);
			System.out.println("상품정보 불러오기 성공");
			
			request.setAttribute("p", p);
			path="productdetailresult.jsp";
		} catch (SearchException e) {
			System.out.println(e.getMessage());
			System.out.println(prodno);
			request.setAttribute("msg", e.getMessage());
			path="failresult.jsp";
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
		
	}
