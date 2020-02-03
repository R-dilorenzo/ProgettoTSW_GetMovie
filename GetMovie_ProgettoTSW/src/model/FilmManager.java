package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilmManager {

	/**
	 * Ritorna tutti i film presenti nel db.
	 *
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre true
	 */
	public static synchronized ArrayList<Film> doRetrieveAll() {

		ArrayList<Film> film1 = new ArrayList<Film>();
		Connection conn = null;
		PreparedStatement ps = null;
		Film film = null;

		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("SELECT * FROM film");

			ResultSet res = ps.executeQuery();

			while (res.next()) {
				film = new Film();
				film.setNome(res.getString("nome"));
				film.setRegista(res.getString("regista"));
				film.setImg(res.getString("img"));
				film.setGenere(res.getString("genere"));
				film.setAttori(res.getString("attori"));
				film.setDescrizione(res.getString("descrizione"));
				film.setAnno(res.getInt("anno"));
				film.setPrezzo(res.getDouble("prezzo"));
				film1.add(film);
			
			}
			return (film1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * Ritorna i film presenti nel db per genere.
	 *
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre true
	 */
	public static synchronized ArrayList<Film> ReturnGenereFilm(String action) {

		ArrayList<Film> film1 = new ArrayList<Film>();
		Connection conn = null;
		PreparedStatement ps = null;
		Film film = null;

		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("SELECT * FROM film WHERE genere=?");
			ps.setString(1, action );
			ResultSet res = ps.executeQuery();

			while (res.next()) {
				film = new Film();
				film.setNome(res.getString("nome"));
				film.setRegista(res.getString("regista"));
				film.setImg(res.getString("img"));
				film.setGenere(res.getString("genere"));
				film.setAttori(res.getString("attori"));
				film.setDescrizione(res.getString("descrizione"));
				film.setAnno(res.getInt("anno"));
				film.setPrezzo(res.getDouble("prezzo"));
				film1.add(film);
			
			}
			return (film1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * Aggiunge un film.
	 *
	 * @param film l'oggetto da aggiungere al database
	 * @return una stringa comunicante l'esito dell'operazione
	 * @throws SQLException the SQL exception
	 * @pre campi non nulli
	 */
	public static String AddFilm(Film film) throws SQLException {
		String nome = film.getNome();
		String regista = film.getRegista();
		String img = film.getImg();
		String genere = film.getGenere();
		String descrizione = film.getDescrizione();
		int anno = film.getAnno();
		double prezzo = film.getPrezzo();
		String attori = film.getAttori();


		Connection con = null;
		PreparedStatement preparedStatement = null;

		try {
			con = DBConnectionPool.getConnection();
			// con = driverManagerConnectionPool.getConnection();
			String query = "insert into film (nome,regista,img,genere,attori,descrizione,anno,prezzo)values (?,?,?,?,?,?,?,?)";
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, nome);
			preparedStatement.setString(2, regista);
			preparedStatement.setString(3, img);
			preparedStatement.setString(4, genere);
			preparedStatement.setString(5, attori);
			preparedStatement.setString(6, descrizione);
			preparedStatement.setInt(7, anno);
			preparedStatement.setDouble(8, prezzo);

			int i = preparedStatement.executeUpdate();

			return "SUCCESS";

		} catch (SQLException e) {
			DBConnectionPool.releaseConnection(con);
		}
		return "Oops.. Something went wrong there..!";

	}
	
	
	/**
	 * Modifica i parametri di un docente già esisitente.
	 * @param film oggetto usato per aggiornare il database
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre uno dei campi non nulli
	 */
	public static synchronized boolean modificaFilm(Film film) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("UPDATE film SET regista = ? WHERE nome = ?");
			ps.setString(1, film.getRegista());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE film SET genere = ? WHERE nome = ?");
			ps.setString(1, film.getGenere());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE film SET attori = ? WHERE nome = ?");
			ps.setString(1, film.getAttori());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE film SET descrizione = ? WHERE nome = ?");
			ps.setString(1, film.getDescrizione());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE film SET anno = ? WHERE nome = ?");
			ps.setInt(1, film.getAnno());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE film SET prezzo = ? WHERE nome = ?");
			ps.setDouble(1, film.getPrezzo());
			ps.setString(2, film.getNome());
			ps.executeUpdate();
			ps.close();

			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * Questo metodo permette di rimuovere una prenotazione dal database.
	 *
	 * @param nome della prenotazione da rimuovere
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @throws SQLException the SQL exception
	 * @pre Prenotazione-> exists(p|p.id==id)
	 */
	public static boolean eliminaFilm(String nome) throws SQLException {
		Connection conn = null;
		PreparedStatement preparedStatement1 = null, ps2 = null;
		String SQLprova = "SELECT * FROM film WHERE nome = ?";
		String selectSQL = "DELETE FROM film WHERE nome = ?";
		try {
			conn = DBConnectionPool.getConnection();
			// con = driverManagerConnectionPool.getConnection();
			ps2 = conn.prepareStatement(SQLprova);
			ps2.setString(1, nome);
			ResultSet rs = ps2.executeQuery();
			if (!rs.next()) {

				return false;
			}
			preparedStatement1 = conn.prepareStatement(selectSQL);
			preparedStatement1.setString(1, nome);
			preparedStatement1.executeUpdate();
		} catch (SQLException e) {
			conn.close();
		} 
		return true;
	}

	/**
	 * Ritorna un avviso distinguendolo grazie al suo id.
	 *
	 * @param id parametro che permette di riconoscere l'avviso da ritornare
	 * @return l'avviso
	 * @throws SQLException the SQL exception
	 * @pre Avvisi-> exists(a|a.id==id)
	 */
	public static Film doRetrieveByNome(String nome) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Film bean = null;

		String selectSQL = "SELECT * FROM film WHERE nome = ?";

		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				bean = new Film();
				bean.setNome(rs.getString("nome"));
				bean.setRegista(rs.getString("regista"));
				bean.setImg(rs.getString("img"));
				bean.setGenere(rs.getString("genere"));
				bean.setAttori(rs.getString("attori"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setAnno(rs.getInt("anno"));
				bean.setPrezzo(rs.getDouble("prezzo"));
			
			}

		} catch (SQLException e) {
			connection.close();
		}
		return bean;
	}
	
	public static boolean modifyImage(Film user) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("UPDATE film SET img = ? WHERE nome = ?");
			ps.setString(1, user.getImg());
			ps.setString(2, user.getNome());
			ps.executeUpdate();
			ps.close();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}//fine classe
