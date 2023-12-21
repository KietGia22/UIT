/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author GIA KIET
 */
public class ThuPhiModel {
    protected String MaKB, MaDV;
    protected int sl;
    protected long thanhtien;

    public ThuPhiModel(String MaKB, String MaDV, int sl, long thanhtien) {
        this.MaKB = MaKB;
        this.MaDV = MaDV;
        this.sl = sl;
        this.thanhtien = thanhtien;
    }

    public String getMaKB() {
        return MaKB;
    }

    public void setMaKB(String MaKB) {
        this.MaKB = MaKB;
    }

    public String getMaDV() {
        return MaDV;
    }

    public void setMaDV(String MaDV) {
        this.MaDV = MaDV;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    public long getThanhtien() {
        return thanhtien;
    }

    public void setThanhtien(long thanhtien) {
        this.thanhtien = thanhtien;
    }
    
    
}
