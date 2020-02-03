package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteManager {
	
	/**
	 *  Medoto di login.
	 *
	 * @param user contiene email e password inseriti dall utente
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre: utente -> exists(u|u.email==email && u|u.password==password)
	 */
	public static synchronized boolean doRetrieveByUser(Utente user) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT * FROM utente WHERE usr = ? AND psw = ?");
			ps.setString(1, user.getUsr());
			ps.setString(2, user.getPsw());

			ResultSet res = ps.executeQuery();

			if (!res.next()) {
				return false;
			} else {
				user.setEmail(res.getString("email"));
				user.setNome(res.getString("nome"));
				user.setCognome(res.getString("cognome"));
				
				user.setDataNascita(res.getString("dataNascita"));
				user.setNumeroCarta(res.getInt("numeroCarta"));
				user.setScadenzaCarta(res.getString("scadenzaCarta"));
				user.setResidenza(res.getString("residenza"));
				user.setLuogoNascita(res.getString("luogoNascita"));
				user.setBoolDati(res.getString("boolDati"));

				return (true);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * Metodo che registra un utente.
	 *
	 * @param user oggetto contenente i dati da inserire nel database
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre: Campi non nulli
	 */
	public static synchronized boolean registerUser(Utente user) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("INSERT INTO utente (nome, cognome, psw, email, usr) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, user.getNome());
			ps.setString(2, user.getCognome());
			ps.setString(3, user.getPsw());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getUsr());

			ps.executeUpdate();

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DBConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * Inserisce i dati utente.
	 *
	 * @param datiUtente l'oggetto da aggiungere al database
	 * @return una stringa comunicante l'esito dell'operazione
	 * @throws SQLException the SQL exception
	 * @pre campi non nulli
	 */
	public static synchronized boolean AddDati(Utente datiUtente) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("UPDATE utente SET dataNascita = ? ,numeroCarta=?,scadenzaCarta=?,residenza=?,luogoNascita=?,boolDati=? WHERE usr = ?");
			ps.setString(1, datiUtente.getDataNascita());
			ps.setInt(2, datiUtente.getNumeroCarta());
			ps.setString(3, datiUtente.getScadenzaCarta());
			ps.setString(4, datiUtente.getResidenza());
			ps.setString(5, datiUtente.getLuogoNascita());
			ps.setString(6, datiUtente.getBoolDati());
			ps.setString(7, datiUtente.getUsr());
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
	 * Modifica i parametri di un docente già esisitente.
	 * @param datiUtente oggetto usato per aggiornare il database
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre uno dei campi non nulli
	 */
	public static synchronized boolean modificaDatiUtente(Utente datiUtente) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("UPDATE utente SET email = ? WHERE usr = ?");
			ps.setString(1, datiUtente.getEmail());
			ps.setString(2, datiUtente.getUsr());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE utente SET numeroCarta = ? WHERE usr = ?");
			ps.setInt(1, datiUtente.getNumeroCarta());
			ps.setString(2, datiUtente.getUsr());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE utente SET scadenzaCarta = ? WHERE usr = ?");
			ps.setString(1, datiUtente.getScadenzaCarta());
			ps.setString(2, datiUtente.getUsr());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE utente SET residenza = ? WHERE usr = ?");
			ps.setString(1, datiUtente.getResidenza());
			ps.setString(2, datiUtente.getUsr());
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("UPDATE utente SET psw = ? WHERE usr = ?");
			ps.setString(1, datiUtente.getPsw());
			ps.setString(2, datiUtente.getUsr());
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
	
	
}
