package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VotiManager {

	public static Voti retrieveAVGfilm(String nomeFilm) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Voti bean = null;

		String selectSQL = "SELECT avg(voti) FROM voti WHERE nomeFilm = ?";

		try {
			connection = DBConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nomeFilm);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				bean = new Voti();
				bean.setUsr(rs.getString("usr"));
				bean.setNomeFilm(rs.getString("nomeFilm"));
				bean.setNumeroVoti(rs.getInt("numeroVoti"));
				bean.setStarRating(rs.getDouble("starRating"));
			
			}

		} catch (SQLException e) {
			connection.close();
		}
		return bean;
	}
	
}
