package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.FilmManager;

/**
 * Servlet implementation class ModificaFilm
 */
@WebServlet("/ModificaFilm")
public class ModificaFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dato = request.getParameter("dato");
		String action = request.getParameter("action");
		Film film = (Film) request.getSession().getAttribute("1Film");
		//Film film = (Film) request.getAttribute("1Film");

		if (dato != null && action != null) {

			switch (action) {
			case "regista":
				film.setRegista(dato);
				break;
			case "genere":
				film.setGenere(dato);
				break;
			case "attori":
				film.setAttori(dato);
				break;
			case "descrizione":
				film.setDescrizione(dato);
				break;
			case "prezzo":
				film.setPrezzo(Double.parseDouble(dato));
				break;
			case "anno":
				film.setAnno(Integer.parseInt(dato));
				break;
			default:
				break;
			}

			FilmManager.modificaFilm(film);
			request.getSession().setAttribute("1Film", film);
			//request.setAttribute("1Film", film);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaFilmAd.jsp");
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
