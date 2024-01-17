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
public class KhamBenhModel {
    protected String MaKB, MaBN, MaBS, YCKham, KetLuan;
    protected int ThanhToan;
    protected LocalDate NgayKham;
    DateTimeFormatter dtformat = DateTimeFormatter.ofPattern("dd-MM-yyyy");

    public KhamBenhModel(String MaKB, String MaBN, String MaBS, String YCKham, String KetLuan, int ThanhToan, LocalDate NgayKham) {
        this.MaKB = MaKB;
        this.MaBN = MaBN;
        this.MaBS = MaBS;
        this.YCKham = YCKham;
        this.KetLuan = KetLuan;
        this.ThanhToan = ThanhToan;
        this.NgayKham = NgayKham;
    }

    public String getMaKB() {
        return MaKB;
    }

    public void setMaKB(String MaKB) {
        this.MaKB = MaKB;
    }

    public String getMaBN() {
        return MaBN;
    }

    public void setMaBN(String MaBN) {
        this.MaBN = MaBN;
    }

    public String getMaBS() {
        return MaBS;
    }

    public void setMaBS(String MaBS) {
        this.MaBS = MaBS;
    }

    public String getYCKham() {
        return YCKham;
    }

    public void setYCKham(String YCKham) {
        this.YCKham = YCKham;
    }

    public String getKetLuan() {
        return KetLuan;
    }

    public void setKetLuan(String KetLuan) {
        this.KetLuan = KetLuan;
    }

    public int getThanhToan() {
        return ThanhToan;
    }

    public void setThanhToan(int ThanhToan) {
        this.ThanhToan = ThanhToan;
    }

    public LocalDate getNgayKham() {
        return NgayKham;
    }

    public void setNgayKham(LocalDate NgayKham) {
        this.NgayKham = NgayKham;
    }

    public String toString(LocalDate dateformat) {
        return dtformat.format(dateformat);
    }
    
    
}
