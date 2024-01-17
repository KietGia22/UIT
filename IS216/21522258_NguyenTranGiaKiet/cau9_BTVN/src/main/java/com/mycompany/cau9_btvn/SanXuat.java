/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cau9_btvn;

/**
 *
 * @author GIA KIET
 */
public class SanXuat extends KhachHang{
    protected int LoaiDien;
    
    public SanXuat(){}
    public SanXuat(String MaKH, String TenKH, String NgayHD, float SLDien, float DonGia, int LoaiDien){
        super(MaKH, TenKH, NgayHD, SLDien, DonGia);
        this.SetID(3);
        this.LoaiDien = LoaiDien;
    }
    
    public void SetLD(int a){
        this.LoaiDien = a;
    }
    public int GetLD(){
        return this.LoaiDien;
    }
    
    @Override
    public float ThanhTien(){
        if(this.GetLD() == 2){
            if(this.GetSLDien() <= 200)
                return this.GetSLDien() * this.GetDonGia();
            else 
                return (float) (this.GetSLDien() * this.GetDonGia() * 0.98);
        } else {
            if(this.GetSLDien() <= 150)
                return this.GetSLDien() * this.GetDonGia();
            else 
                return (float) (this.GetSLDien() * this.GetDonGia() * 0.97);
        }
    }
    
    @Override
    public void Output(){
        super.Output();
        System.out.println("Thanh tien cua khach hang thuoc doi tuong san xuat: " + this.ThanhTien());
    }
}
