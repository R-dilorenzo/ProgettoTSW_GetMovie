package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.FilmManager;

/**
 * Servlet implementation class ModificaImg
 */
@WebServlet("/ModificaImg")
@MultipartConfig
public class ModificaImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaImg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Film doc = (Film) request.getAttribute("1Film");
		Film doc = (Film) request.getSession().getAttribute("1Film");
		javax.servlet.http.Part filePart = request.getPart("img");
		InputStream fileContent = filePart.getInputStream();
		String fileName = filePart.getSubmittedFileName();

		String tomcatRoot = getServletContext().getRealPath("/");
		String imagePath = "immagini\\" + doc.getNome() + fileName;

		String filePath = tomcatRoot + imagePath;

		System.out.println(filePath);

		OutputStream os = null;
		System.out.println("prova");
		try {
			File file = new File(filePath);
			file.createNewFile();

			os = new FileOutputStream(file, false);
			byte[] buffer = new byte[1024];
			int length;
			while ((length = fileContent.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
		} finally {
			fileContent.close();
			os.close();
		}
		doc.setImg("immagini/" + doc.getNome() + fileName);
		if (FilmManager.modifyImage(doc)) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaFilmAd.jsp");
			requestDispatcher.forward(request, response);
		}
	
	}

}
