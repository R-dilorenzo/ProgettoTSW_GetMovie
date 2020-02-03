package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CarrelloManager;
import model.Utente;

/**
 * Servlet implementation class ArticoliUtente
 */
@WebServlet("/ArticoliUtente")
public class ArticoliUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticoliUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente datiUtente1=(Utente) request.getSession().getAttribute("Utente");
		
		
		request.setAttribute("carrel", CarrelloManager.returnAllCartUtente(datiUtente1.getUsr()));
		
		//RequestDispatcher requestDispatcher = request.getRequestDispatcher("/CarrelloUtente.jsp");
		//requestDispatcher.forward(request, response);
		//request.getRequestDispatcher("CarrelloUtente.jsp").forward(request, response);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CarrelloUtente.jsp");
		dispatcher.forward(request, response);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
