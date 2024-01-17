/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cau4;

/**
 *
 * @author GIA KIET
 */
public class Sach {
    private String MaSach, TenSach, NhaXuatBan, TacGia;
    private int  Gia;
    public Sach() {
    }
    
    public Sach(String MaSach, String TenSach, int Gia, String NhaXuatBan, String TacGia) {
        this.MaSach = MaSach;
        this.TenSach = TenSach;
        this.Gia = Gia;
        this.NhaXuatBan = NhaXuatBan;
        this.TacGia = TacGia;
    }

    public void setGia(int Gia) {
        this.Gia = Gia;
    }

    public void setNhaXuatBan(String NhaXuatBan) {
        this.NhaXuatBan = NhaXuatBan;
    }

    public void setMaSach(String MaSach) {
        this.MaSach = MaSach;
    }

    public void setTacGia(String TacGia) {
        this.TacGia = TacGia;
    }

    public void setTenSach(String TenSach) {
        this.TenSach = TenSach;
    }

    public String getMaSach() {
        return MaSach;
    }

    public String getTenSach() {
        return TenSach;
    }

    public int getGia() {
        return Gia;
    }

    public String getNhaXuatBan() {
        return NhaXuatBan;
    }

    public String getTacGia() {
        return TacGia;
    }
    
    @Override
    public String toString(){
        return "Sach{" + "Mã Sách = "+MaSach + ", Tên Sách = "+TenSach+", Tác giả = "+TacGia+ ", NXB = "+NhaXuatBan+", Giá = "+Gia+"}";
    }
}
