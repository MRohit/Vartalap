package com.vartalap.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Autosuggest
 */
@WebServlet("/Autosuggest")
public class Autosuggest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Autosuggest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out =response.getWriter();
		out.println("<h1>Helo</h1>");
		out.println("<table id='example' class='display' cellspacing='0' width='100%'> "
				+ "   <thead>"
				+ " <tr> <th>Name</th>   <th>Position</th>     <th>Office</th>  <th>Extn.</th> <th>Start date</th> <th>Salary</th>  </tr>"
				+ "</thead> <tfoot>"
				+ " <tr> <th>Name</th> <th>Position</th>  <th>Office</th> <th>Extn.</th> <th>Start date</th><th>Salary</th> </tr>"
				+ "</tfoot> </table>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
