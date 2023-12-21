/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cau9_btvn;

/**
 *
 * @author GIA KIET
 */
public class KinhDoanh extends KhachHang{
    public KinhDoanh(){}
    public KinhDoanh(String MaKH, String TenKH, String NgayHD, float SLDien, float DonGia){
        super(MaKH, TenKH, NgayHD, SLDien, DonGia);
        this.SetID(2);
    }
    
    @Override
    public float ThanhTien(){
        if(this.GetSLDien() <= 400)
            return this.GetSLDien() * this.GetDonGia();
        else 
            return (float) (this.GetSLDien() * this.GetDonGia() * 0.05);
    }
    
    @Override
    public void Output(){
        super.Output();
        System.out.println("Thanh tien cua khach hang thuoc doi tuong kinh doanh: " + this.ThanhTien());
    }
}
