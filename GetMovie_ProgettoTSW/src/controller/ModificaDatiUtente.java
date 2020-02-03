package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FilmManager;
import model.Utente;
import model.UtenteManager;

/**
 * Servlet implementation class ModificaDatiUtente
 */
@WebServlet("/ModificaDatiUtente")
public class ModificaDatiUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaDatiUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dato = request.getParameter("dato");
		String action = request.getParameter("action");
		Utente datiUtente = (Utente) request.getSession().getAttribute("Utente");

		if (dato != null && action != null) {

			switch (action) {
			case "email":
				datiUtente.setEmail(dato);
				break;
			case "numeroCarta":
				datiUtente.setNumeroCarta(Integer.parseInt(dato));
				break;
			case "scadenzaCarta":
				datiUtente.setScadenzaCarta(dato);
				break;
			case "residenza":
				datiUtente.setResidenza(dato);
				break;
			case "psw":
				datiUtente.setPsw(dato);
				break;
			default:
				break;
			}

			UtenteManager.modificaDatiUtente(datiUtente);
			request.getSession().setAttribute("Utente", datiUtente);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(request.getParameter("viewid"));
			requestDispatcher.forward(request, response);
		}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
