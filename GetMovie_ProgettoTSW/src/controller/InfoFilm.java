package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FilmManager;
import model.VotiManager;

/**
 * Servlet implementation class InfoFilm
 */
@WebServlet("/InfoFilm")
public class InfoFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome =request.getParameter("nome");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		try {
			//request.setAttribute("1Film", FilmManager.doRetrieveByNome(nome));
			session.setAttribute("InfoFilm", FilmManager.doRetrieveByNome(nome));
			
			session.setAttribute("votoFilm", VotiManager.retrieveAVGfilm(nome));

			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelFilm.jsp");
			requestDispatcher.forward(request, response);

		} catch (Exception e) {
			/*
			request.setAttribute("exception", e);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
			requestDispatcher.forward(request, response);
			*/
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('Il nome del film non è corretto o non è presente');");
			   out.println("location='HomePage.jsp';");
			   out.println("</script>");
		}	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
