package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloManager {
	
	public static synchronized ArrayList<Carrello> returnAllCartUtente(String usr) {

		ArrayList<Carrello> carrelloUtente = new ArrayList<Carrello>();
		Connection conn = null;
		PreparedStatement ps = null;
		Carrello cart = null;

		try {
			conn = DBConnectionPool.getConnection();

			ps = conn.prepareStatement("SELECT * FROM carrello WHERE usr=?");
			ps.setString(1, usr );
			ResultSet res = ps.executeQuery();

			while (res.next()) {
				cart = new Carrello();
				cart.setNomeFilm(res.getString("nome"));
				cart.setUsr(res.getString("usr"));
				cart.setImg(res.getString("img"));
				cart.setPrezzo(res.getDouble("prezzo"));
				carrelloUtente.add(cart);
			
			}
			return (carrelloUtente);

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
	
	public static String aggiungiAlCarrello(Carrello carrello) throws SQLException {
		String nomeFilm=carrello.getNomeFilm();
		String img=carrello.getImg();
		String usr=carrello.getUsr();
		double prezzo=carrello.getPrezzo();


		Connection con = null;
		PreparedStatement preparedStatement = null;

		try {
			con = DBConnectionPool.getConnection();
			// con = driverManagerConnectionPool.getConnection();
			String query = "insert into carrello (nome,img,prezzo,usr)values (?,?,?,?)";
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, nomeFilm);
			preparedStatement.setString(2, img);
			preparedStatement.setDouble(3, prezzo);
			preparedStatement.setString(4, usr);
		

			int i = preparedStatement.executeUpdate();

			return "SUCCESS";

		} catch (SQLException e) {
			DBConnectionPool.releaseConnection(con);
		}
		return "Oops.. Something went wrong there..!";

	}
	
	public static boolean eliminaCarrello(String usr) throws SQLException {
		Connection conn = null;
		PreparedStatement preparedStatement1 = null, ps2 = null;
		String SQLprova = "SELECT * FROM carrello WHERE usr = ?";
		String selectSQL = "DELETE FROM carrello WHERE usr = ?";
		try {
			conn = DBConnectionPool.getConnection();
			// con = driverManagerConnectionPool.getConnection();
			ps2 = conn.prepareStatement(SQLprova);
			ps2.setString(1, usr);
			ResultSet rs = ps2.executeQuery();
			if (!rs.next()) {

				return false;
			}
			preparedStatement1 = conn.prepareStatement(selectSQL);
			preparedStatement1.setString(1, usr);
			preparedStatement1.executeUpdate();
		} catch (SQLException e) {
			conn.close();
		} 
		return true;
	}
	
	public static boolean eliminaFilmCarrello(String usr,String nome) throws SQLException {
		Connection conn = null;
		PreparedStatement preparedStatement1 = null, ps2 = null;
		String SQLprova = "SELECT * FROM carrello WHERE usr = ? AND nome=?";
		String selectSQL = "DELETE FROM carrello WHERE usr = ? AND nome=?";
		try {
			conn = DBConnectionPool.getConnection();
			// con = driverManagerConnectionPool.getConnection();
			ps2 = conn.prepareStatement(SQLprova);
			ps2.setString(1, usr);
			ps2.setString(2, nome);
			ResultSet rs = ps2.executeQuery();
			if (!rs.next()) {

				return false;
			}
			preparedStatement1 = conn.prepareStatement(selectSQL);
			preparedStatement1.setString(1, usr);
			preparedStatement1.setString(2, nome);
			preparedStatement1.executeUpdate();
		} catch (SQLException e) {
			conn.close();
		} 
		return true;
	}
}
