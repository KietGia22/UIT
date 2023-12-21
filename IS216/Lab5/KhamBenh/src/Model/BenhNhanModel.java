/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author GIA KIET
 */
public class BenhNhanModel {
    protected String MaBN, TenBN, DiaChi, SDT;
    protected int Gtinh;
    protected LocalDate NgaySinh;
    DateTimeFormatter dtformat = DateTimeFormatter.ofPattern("dd-MM-yyyy");

    public BenhNhanModel(String MaBN, String TenBN) {
        this.MaBN = MaBN;
        this.TenBN = TenBN;
    }
    
    

    public BenhNhanModel(String MaBN, String TenBN, String DiaChi, String SDT, int Gtinh, LocalDate NgaySinh) {
        this.MaBN = MaBN;
        this.TenBN = TenBN;
        this.DiaChi = DiaChi;
        this.SDT = SDT;
        this.Gtinh = Gtinh;
        this.NgaySinh = NgaySinh;
    }

    public String getMaBN() {
        return MaBN;
    }

    public void setMaBN(String MaBN) {
        this.MaBN = MaBN;
    }

    public String getTenBN() {
        return TenBN;
    }

    public void setTenBN(String TenBN) {
        this.TenBN = TenBN;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public int getGtinh() {
        return Gtinh;
    }

    public void setGtinh(int Gtinh) {
        this.Gtinh = Gtinh;
    }

    public LocalDate getNgaySinh() {
        return NgaySinh;
    }

    public void setNgaySinh(LocalDate NgaySinh) {
        this.NgaySinh = NgaySinh;
    }
 
    public String toString(LocalDate dateformat) {
        return dtformat.format(dateformat);
    }
    
}
