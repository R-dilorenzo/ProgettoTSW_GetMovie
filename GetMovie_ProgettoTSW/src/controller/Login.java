package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UtenteManager;
import model.Utente;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recupero username e password dalla form
		//con i campi usr e psw
		Utente utente = new Utente(request.getParameter("usr"), request.getParameter("psw"));
		
		HttpSession session = request.getSession();

		if (UtenteManager.doRetrieveByUser(utente)) {
			session.setAttribute("Utente", utente);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/HomePage.jsp");
			requestDispatcher.forward(request, response);
		} else {
			request.setAttribute("loginError", "True");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
