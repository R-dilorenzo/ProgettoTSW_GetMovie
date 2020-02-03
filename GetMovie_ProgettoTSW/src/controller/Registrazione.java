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
 * Servlet implementation class Registrazione
 */
@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrazione() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utente utente = new Utente(request.getParameter("usr"), request.getParameter("psw"));
		
		HttpSession session = request.getSession();
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String psw = request.getParameter("psw");
		String usr = request.getParameter("usr");
		String email = request.getParameter("email");

		Utente bean = new Utente();
	
		bean.setNome(nome);
		bean.setCognome(cognome);
		bean.setPsw(psw);
		bean.setUsr(usr);
		bean.setEmail(email);

		if (UtenteManager.registerUser(bean)) {
			UtenteManager.doRetrieveByUser(utente);
			session.setAttribute("Utente",utente);
			//session.SetAttribute("Utente",utente);
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		} else {
			request.setAttribute("ERROR", "true");
			request.getRequestDispatcher("ERROR.jsp").forward(request, response);
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
