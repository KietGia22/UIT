/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cau9_btvn;

/**
 *
 * @author GIA KIET
 */
public class SinhHoat extends KhachHang{
    protected int DinhMuc;
    
    public SinhHoat(){}
    
    public SinhHoat(String MaKH, String TenKH, String NgayHD, float SLDien, float DonGia, int DinhMuc){
        super(MaKH, TenKH, NgayHD, SLDien, DonGia);
        this.DinhMuc = DinhMuc;
        this.SetID(1);
    }
    
    public void SetDinhMuc(int a){
        this.DinhMuc = a;
    }
    public int GetDinhMuc(){
        return this.DinhMuc;
    }
    
    @Override
    public float ThanhTien(){
        if(this.GetDinhMuc() >= this.GetSLDien())
            return this.GetSLDien() * this.GetDonGia();
        else 
            return (this.GetSLDien() * this.GetDonGia() * this.GetDinhMuc()) + ((this.GetSLDien() - this.GetDinhMuc()) * this.GetDonGia() * 2);
    }
    
    @Override
    public void Output(){
        super.Output();
        System.out.println("Thanh tien cua khach hang thuoc doi tuong sinh hoat: " + this.ThanhTien());
    }
}