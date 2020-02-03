package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FilmManager;

/**
 * Servlet implementation class SelezioneFilm
 */
@WebServlet("/SelezioneFilm")
public class SelezioneFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelezioneFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome =request.getParameter("nome");

		HttpSession session = request.getSession();
		try {
			//request.setAttribute("1Film", FilmManager.doRetrieveByNome(nome));
			session.setAttribute("1Film", FilmManager.doRetrieveByNome(nome));

			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaFilmAd.jsp");
			requestDispatcher.forward(request, response);

		} catch (Exception e) {
			request.setAttribute("exception", e);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("exception1.jsp");
			requestDispatcher.forward(request, response);
		}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
