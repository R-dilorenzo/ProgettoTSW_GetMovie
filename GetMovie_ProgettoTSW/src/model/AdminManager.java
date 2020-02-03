package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminManager {

	/**
	 *  Medoto di login.
	 *
	 * @param admin contiene email e password inseriti dall utente
	 * @return true se l'operazione va a buon fine altrimenti false
	 * @pre: utente -> exists(a|a.usr==usr && a|a.password==password)
	 */
	public static synchronized boolean LoginAdmin(Admin admin) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
			ps.setString(1, admin.getUsername());
			ps.setString(2, admin.getPassword());

			ResultSet res = ps.executeQuery();

			if (!res.next()) {
				return false;
			} else {
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
}
