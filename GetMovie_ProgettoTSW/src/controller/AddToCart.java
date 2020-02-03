package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.CarrelloManager;
import model.Film;
import model.FilmManager;
import model.Utente;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente datiUtente = (Utente) request.getSession().getAttribute("Utente");
		Film film = (Film) request.getSession().getAttribute("InfoFilm");
		if(datiUtente == null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			if(film == null) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ERROR.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				Carrello cart=new Carrello();
				cart.setImg(film.getImg());
				cart.setNomeFilm(film.getNome());
				cart.setPrezzo(film.getPrezzo());
				cart.setUsr(datiUtente.getUsr());

				String userRegistered = null;
				try {
					userRegistered = CarrelloManager.aggiungiAlCarrello(cart);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				if (userRegistered.equals("SUCCESS")) {
		            request.getRequestDispatcher("CarrelloUtente.jsp").forward(request, response);
				} else {
					request.setAttribute("errMessage", userRegistered);
		            request.getRequestDispatcher("/exception.jsp").forward(request, response);
				}
			}
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
