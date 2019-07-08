package org.montecuollo.utils;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbUtils {
	
	public static Connection getDataSourceConnection(String dataSourceName)
			throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		try {
			DataSource ds = (DataSource) envContext.lookup("jdbc/"
					+ dataSourceName);
			Connection conn = ds.getConnection();			
			return conn;
		} catch (NamingException nex) {
			throw new Exception("Il datasource " + dataSourceName
					+ " non e' definito nell'environment.\n"
					+ "E' necessario aggiungerlo al file context.xml.\n"
					+ nex.getMessage());
		} catch (Exception ex) {
			throw new Exception(
					"Si e' verificata un'eccezione imprevista nel tentativo di stabilire una connessione verso il datasource "
							+ dataSourceName + ":\n" + ex.getMessage());
		}
	}

}
