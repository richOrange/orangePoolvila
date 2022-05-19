package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SuppliesDao;
import vo.Supplies;

@WebServlet("/host/suppliesController")
public class SuppliesController extends HttpServlet {
	
	private SuppliesDao suppliesDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pvNo = -1;
		if(Integer.parseInt(request.getParameter("pvNo")) != -1) {
			pvNo = Integer.parseInt(request.getParameter("pvNo"));
		}
		System.out.println("[SuppliesController.doGet()] pvNo : " + pvNo);
		
		suppliesDao = new SuppliesDao();
		ArrayList<Supplies> list = suppliesDao.selectSupplies();
		
		request.setAttribute("list", list);
		request.setAttribute("pvNo", pvNo);
		
		request.getRequestDispatcher("/WEB-INF/view/suppliesList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		suppliesDao = new SuppliesDao();
		
		// 요청값 처리
		int pvNo = -1;
		if(Integer.parseInt(request.getParameter("pvNo")) != -1) {
			pvNo = Integer.parseInt(request.getParameter("pvNo"));
		}
		System.out.println("[CookingToolController.doPost()] pvNo : " + pvNo);
		
		String suppliesName = null;
		if(request.getParameter("suppliesName") != null) {
			suppliesName =  request.getParameter("suppliesName");
			suppliesDao.insertSupplies(suppliesName);
		}
		
		// 디버깅
		System.out.println("[SuppliesController.doPost()] suppliesName : " + suppliesName);
		
		response.sendRedirect(request.getContextPath() + "/host/suppliesController?pvNo=" + pvNo);
	}

}
