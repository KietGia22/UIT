/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.DichVuModel;
import View.KhamBenh;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author GIA KIET
 */
public class DichVuController {
    public ArrayList<DichVuModel> getTCDV(){
        String sql  = "";
        ArrayList<DichVuModel> dvModel =  new ArrayList<DichVuModel>();
        Connection conn = null;
        ResultSet rs = null;
        CallableStatement callsql = null;
        
        try {
            conn = KhamBenh.getJDBCConnection();
            sql = "{call GETTCDV(?)}";
            callsql = conn.prepareCall(sql);
            callsql.registerOutParameter(1, OracleTypes.CURSOR);
            callsql.execute();
            rs = (ResultSet) callsql.getObject(1);
            
            while(rs.next()){
                DichVuModel dv = new DichVuModel(
                                       rs.getString("MADV"),
                                       rs.getString("TENDV"),
                                        rs.getLong("DONGIA"));
                dvModel.add(dv);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dvModel;
    }
}
