package db;

import java.sql.*;

public class JavaBean {

	String error;
	Connection con;

	public JavaBean() {
	}

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/titualex?useSSL=false", "basic_user", "98u%E7%p7d7hze$jTE");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "basic_user", "98u%E7%p7d7hze$jTE");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "basic_user", "98u%E7%p7d7hze$jTE");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

	public void adaugaJucator(String nume, String prenume, String email, String data_nastere, String gen, String nationalitate)
			throws SQLException, Exception {
		if (con != null) {
			try {
				if(email == null) email = "Unknown";
				if(gen == null) gen = "Unknown";
				if(nationalitate == null) nationalitate = "Unknown";
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into jucatori(nume, prenume, email, data_nasterii, gen, nationalitate) values('" + nume + "'  , '" + prenume + "', '" + email + "', '" + data_nastere + "', '" + gen + "', '" + nationalitate +"');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaJucator()

	public void adaugaJoc(String nume, Long nr_jucatori, String tip, String data_lansarii, String Developer, String next_champ, Long nr_champ, String act_Champion)
			throws SQLException, Exception {
		if (con != null) {
			try {
				if(next_champ == null) next_champ ="TBA";
				if(act_Champion == null) act_Champion = "None";
				if(Developer == null) Developer = "Unknown";
				if(tip == null) tip = "Unknown";
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into jocuri(nume, nr_jucatori, tip, data_lansarii, developer, urmatorul_campionat, numar_campionate, campion_actual) values('" + nume  + "', '" + nr_jucatori + "', '" + tip + "', '" + data_lansarii + "', '" + Developer + "', '" + next_champ + "', '"+ nr_champ + "', '" + act_Champion + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaJoc()

	public void adaugaProfil(Long idjucator, Long idjoc, String data_creare, String grad, Long nr_camp, Long nr_medalii, int campion, String username)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// create a prepared SQL statement
				if(grad == null) grad ="N/A";
				Statement stmt;
				stmt = con.createStatement();
				if(data_creare != "" || data_creare != null)
					stmt.executeUpdate("insert into profil(idjucator, idjoc, data_creare, grad, campionate_participate, nr_medalii, campion, username) values('" + idjucator + "'  , '" + idjoc + "', '" + data_creare + "', '" + grad  + "', '" + nr_camp + "', '" + nr_medalii + "', '" +  campion + "', '" + username + "');");
				else
				    stmt.executeUpdate("insert into profil(idjucator, idjoc, data_creare, grad, campionate_participate, nr_medalii, campion, username) values('" + idjucator + "'  , '" + idjoc + "', CURDATE(), '" + data_creare + "', '" + grad + "', '" + nr_camp + "', '" + nr_medalii + "', '" +  campion + "', '" + username + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaProfil()

	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select * from `titualex`.`" + tabel + "`;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()

	public ResultSet vedeProfil() throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select a.nume numeJucator, a.prenume prenumeJucator, a.nationalitate Nation, b.nume numeJoc, b.tip, c.idprofil, c.idjoc idjoc_profil, c.idjucator idjucator_profil, c.username, c.data_creare, c.grad, c.nr_medalii, c.campionate_participate, c.campion from jucatori a, jocuri b, profil c where a.idjucator = c.idjucator and b.idjoc = c.idjoc;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeConsultatie()

	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null) {
			try {
				// create a prepared SQL statement
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()

	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) {
			try {
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + ";");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()

	public void modificaTabela(String tabela, String IDTabela, Long ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1)) {
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					} else {
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
					}
				}
				update = update + temp;
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()

	public ResultSet intoarceLinie(String tabela, Long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Execute query
			String queryString = ("SELECT * FROM " + tabela + " where idjucator=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinie()

	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, Long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Execute query
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()

	public ResultSet intoarceProfilId(Long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Execute query
			String queryString = ("SELECT a.nume numeJucator, a.prenume prenumeJucator, a.nationalitate, b.nume numeJoc, b.tip, c.idprofil, c.idjoc idjoc_profil, c.idjucator idjucator_profil, data_creare, grad, c.nr_medalii, c.campionate_participate, campion, username FROM jucatori a, jocuri b, profil c WHERE a.idjucator = c.idjucator AND b.idjoc = c.idjoc AND idprofil = '" + ID + "';");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
}