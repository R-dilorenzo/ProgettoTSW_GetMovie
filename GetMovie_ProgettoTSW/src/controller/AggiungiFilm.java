package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import model.Film;
import model.FilmManager;

/**
 * Servlet implementation class AggiungiFilm
 */
@WebServlet("/AggiungiFilm")
@MultipartConfig
public class AggiungiFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		/*
		String nome = request.getParameter("nome");
		String regista = request.getParameter("regista");
		String img = request.getParameter("img");
		String genere = request.getParameter("genere");
		String attori = request.getParameter("attori");
		String descrizione = request.getParameter("descrizione");
		int anno = Integer.parseInt(request.getParameter("anno"));
		double prezzo = Double.parseDouble(request.getParameter("prezzo"));
		
		Film film = new Film();
//----------
		javax.servlet.http.Part filePart = request.getPart("img");
		InputStream fileContent = filePart.getInputStream();
		String fileName = filePart.getSubmittedFileName();

		String tomcatRoot = getServletContext().getRealPath("/");
//		String imagePath = "immagini\\" + film.getNome() + fileName;
		String imagePath = "immagini\\" + fileName;

		String filePath = tomcatRoot + imagePath;

		System.out.println(filePath);

		OutputStream os = null;
		System.out.println("prova");
		try {
			File file = new File(filePath);
			System.out.println("prova");
			file.createNewFile();
			System.out.println("prova");

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
		film.setImg("immagini/"  + fileName);
//-----------
		film.setNome(nome);
		film.setRegista(regista);
//		film.setImg(img);
		film.setGenere(genere);
		film.setAttori(attori);
		film.setDescrizione(descrizione);
		film.setAnno(anno);
		film.setPrezzo(prezzo);


		String userRegistered = null;
		try {
			userRegistered = FilmManager.AddFilm(film);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (userRegistered.equals("SUCCESS")) {
            request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		} else {
			request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/exception.jsp").forward(request, response);
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String nome = request.getParameter("nome");
		String regista = request.getParameter("regista");
		String img = request.getParameter("img");
		String genere = request.getParameter("genere");
		String attori = request.getParameter("attori");
		String descrizione = request.getParameter("descrizione");
		int anno = Integer.parseInt(request.getParameter("anno"));
		double prezzo = Double.parseDouble(request.getParameter("prezzo"));
		
		Film film = new Film();
//----------
		/*
		  boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	        if (isMultipart) {
	            FileItemFactory factory = new DiskFileItemFactory();
	            ServletFileUpload upload = new ServletFileUpload(factory);

	            try {
	                List items = upload.parseRequest((RequestContext) request);
	                Iterator iterator = items.iterator();
	                while (iterator.hasNext()) {
	                    FileItem item = (FileItem) iterator.next();

	                    if (!item.isFormField()) {
	                        String fileName = item.getName();

	                        String root = getServletContext().getRealPath("/");
	                        File path = new File(root + "/uploads");
	                        if (!path.exists()) {
	                            boolean status = path.mkdirs();
	                        }

	                        File uploadedFile = new File(path + "/" + fileName);
	                        System.out.println(uploadedFile.getAbsolutePath());
	                        item.write(uploadedFile);

	                	    film.setImg(item);
	                    }
	                }
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        */
//----------
		javax.servlet.http.Part filePart = request.getPart("img");
		InputStream fileContent = filePart.getInputStream();
		String fileName = filePart.getSubmittedFileName();

		String tomcatRoot = getServletContext().getRealPath("/");
		
		String imagePath = "immagini\\" + nome + fileName;

//	String imagePath = "immagini\\" + film.getI() + fileName;
//		String imagePath = "immagini\\" + fileName;

		String filePath = tomcatRoot + imagePath;

		System.out.println(filePath);

		OutputStream os = null;
		
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
			film.setImg("immagini/"+ nome + fileName);
	
			fileContent.close();
			os.close();
		}
//----------
  
		film.setNome(nome);
		film.setRegista(regista);
	//film.setImg(img);
		film.setGenere(genere);
		film.setAttori(attori);
		film.setDescrizione(descrizione);
		film.setAnno(anno);
		film.setPrezzo(prezzo);


		String userRegistered = null;
		try {
			userRegistered = FilmManager.AddFilm(film);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (userRegistered.equals("SUCCESS")) {
            request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		} else {
			request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/exception.jsp").forward(request, response);
		}
	}
	

}
