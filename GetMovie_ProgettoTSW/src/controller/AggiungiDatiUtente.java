package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import model.UtenteManager;
import model.FilmManager;

/**
 * Servlet implementation class AggiungiDatiUtente
 */
@WebServlet("/AggiungiDatiUtente")
public class AggiungiDatiUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiDatiUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usr = request.getParameter("usr");
		String dataNascita = request.getParameter("dataNascita");
		int numeroCarta = Integer.parseInt(request.getParameter("numeroCarta"));
		String scadenzaCarta = request.getParameter("scadenzaCarta");
		String residenza = request.getParameter("residenza");
		String luogoNascita = request.getParameter("luogoNascita");
		String boolDati = request.getParameter("boolDati");
		
		Utente datiUtente = (Utente) request.getSession().getAttribute("Utente");
		

		datiUtente.setUsr(usr);
		datiUtente.setDataNascita(dataNascita);
		datiUtente.setNumeroCarta(numeroCarta);
		datiUtente.setScadenzaCarta(scadenzaCarta);
		datiUtente.setResidenza(residenza);
		datiUtente.setLuogoNascita(luogoNascita);
		datiUtente.setBoolDati(boolDati);


		UtenteManager.AddDati(datiUtente);

		request.getSession().setAttribute("Utente", datiUtente);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(request.getParameter("viewid"));
		requestDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
