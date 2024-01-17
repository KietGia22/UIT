/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package View;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author GIA KIET
 */
public class ConnectDB {
    public static Connection getJDBCConnection(String hostName, String sid,
    String userName, String password) throws ClassNotFoundException, SQLException{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String connectionURL = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;

        Connection conn = DriverManager.getConnection(connectionURL, userName,
                password);
        return conn;
    }
    
    public static Connection getConn() throws SQLException, ClassNotFoundException {
        String hostName = "localhost";
        String sid = "orcl";
        String userName = "c##finaltest";
        String password = "123456";
        return getJDBCConnection(hostName, sid, userName, password);
    }
    
    public static void main(String[] args)throws SQLException,
          ClassNotFoundException {
          System.out.println("Get connection ... ");
          Connection conn = getConn();
          System.out.println("Get connection " + conn);
          System.out.println("Done!");
  }
}
