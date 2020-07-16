package com.pe.bluering.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pe.admin.action.AdminAction;
import com.pe.admin.action.AdminActionFactory;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin/AdminController.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		String command = request.getParameter("command");
		PrintWriter out = response.getWriter();
		System.out.println(command);
		
		AdminActionFactory af = new AdminActionFactory();
		AdminAction action = af.getAction(command);
		
		if(action != null) {
			try {
				action.execute(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
