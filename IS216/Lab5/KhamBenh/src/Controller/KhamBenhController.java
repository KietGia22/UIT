/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.BacSiModel;
import Model.BenhNhanModel;
import Model.KhamBenhModel;
import Model.ThuPhiModel;
import View.KhamBenh;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author GIA KIET
 */
public class KhamBenhController {
    public ArrayList<BenhNhanModel> getTCBN(String MaBS, LocalDate NKB){
        ArrayList<BenhNhanModel> bnModel = new ArrayList<BenhNhanModel>();
        String sql  = "";
        Connection conn = null;
        ResultSet rs = null;
        CallableStatement callsql = null;
        try {
            conn = KhamBenh.getJDBCConnection();
            sql = "{call GETTCBN(?, ?, ?)}";
            callsql = conn.prepareCall(sql);
            callsql.setString(1, MaBS);
            callsql.setDate(2, java.sql.Date.valueOf(NKB));
            callsql.registerOutParameter(3, OracleTypes.CURSOR);
            callsql.execute();
            rs = (ResultSet) callsql.getObject(3);
            
            while(rs.next()){
                BenhNhanModel bs = new BenhNhanModel(
                                       rs.getString("MABN"),
                                       rs.getString("TENBN"));
                bnModel.add(bs);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bnModel;
    }
    
    public KhamBenhModel getBNYCKham(String MaBS, String MaBN, LocalDate NKB){
        KhamBenhModel kbModel = null;
        String sql  = "";
        Connection conn = null;
        ResultSet rs = null;
        CallableStatement callsql = null;
        try {
            conn = KhamBenh.getJDBCConnection();
            sql = "{call GETBNYCKHAM(?, ?, ?, ?)}";
            callsql = conn.prepareCall(sql);
            callsql.setString(1, MaBS);
            callsql.setString(2, MaBN);
            callsql.setDate(3, java.sql.Date.valueOf(NKB));
            callsql.registerOutParameter(4, OracleTypes.CURSOR);
            callsql.execute();
            rs = (ResultSet) callsql.getObject(4);
            
            while(rs.next()){
                kbModel = new KhamBenhModel(rs.getString("MAKB"),
                                       rs.getString("MABS"),
                                       rs.getString("MABN"),
                                       rs.getString("YEUCAUKHAM"),
                                       rs.getString("KETLUAN"),
                                       rs.getInt("THANHTOAN"),
                                       rs.getDate("NGAYKHAM").toLocalDate());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return kbModel;
    }
    
    public int InsertThuPhi(ThuPhiModel tp){
        int check;
        String sql = "INSERT INTO THUPHI (MAKB, MADV, SOLUONG, THANHTIEN) VALUES(?, ?, ?, ?)";
        Connection conn = null;
        CallableStatement callsql = null;
        try {
            conn = KhamBenh.getJDBCConnection();
            callsql = conn.prepareCall(sql);
            callsql.setString(1, tp.getMaKB());
            callsql.setString(2, tp.getMaDV());
            callsql.setInt(3, tp.getSl());
            callsql.setLong(4, tp.getThanhtien());
            check = callsql.executeUpdate();
            return check;
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return 0;
    }
    
    public int update(KhamBenhModel kb){
        int check;
        String sql = "UPDATE KHAMBENH SET KETLUAN = ? WHERE MAKB= ?";
        Connection conn = null;
        CallableStatement callsql = null;
        try {
            conn = KhamBenh.getJDBCConnection();
            callsql = conn.prepareCall(sql);
            callsql.setString(1, kb.getKetLuan());
            callsql.setString(2, kb.getMaKB());
            check = callsql.executeUpdate();
            conn.close();
            return check;
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return 0;
    }
    
}
