package com.vartalap.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.vartalap.dao.LoginImplDAO;
import com.vartalap.service.VartalapService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	//@Autowired

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		PrintWriter out =response.getWriter();
		out.println("<h1>Helo</h1>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		PrintWriter out =response.getWriter();
		//out.println("<h1>Helo</h1>");
		VartalapService service = new VartalapService();
		System.out.println(service);
		
		Boolean id2 = LoginImplDAO.validateUser2(userName, password);
		if(id2){
			response.sendRedirect("home");
			HttpSession session=request.getSession(true);
			session.setAttribute("userName", userName);
		}else{
			out.println("<script> alert('Wrong Credentials');</script>");
			response.sendRedirect("home");
			
		}
	}

	

}
