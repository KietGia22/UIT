/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cau9_btvn;

/**
 *
 * @author GIA KIET
 */
public abstract class KhachHang implements IKhachHang {
    protected String MaKH, TenKH, NgayHD;
    protected float SLDien, DonGia;
    protected int Id;
    
    public KhachHang(){};
    public KhachHang(String MaKH, String TenKH, String NgayHD, float SLDien, float DonGia){
        this.MaKH = MaKH;
        this.TenKH = TenKH;
        this.NgayHD = NgayHD;
        this.SLDien = SLDien;
        this.DonGia = DonGia;
    }
    
    public void SetMaKH(String a){
        this.MaKH = a;
    }
    public String GetMaKH(){
        return this.MaKH;
    }
    
    public void SetTenKH(String a){
        this.TenKH = a;
    }
    public String GetTenKH(){
        return this.TenKH;
    }
    
    public void SetNgayHD(String a){
        this.NgayHD = a;
    }
    public String GetNgayHD(){
        return this.NgayHD;
    }
    
    public void SetSLDien(float a){
        this.SLDien = a;
    }
    public float GetSLDien(){
        return this.SLDien;
    }
    
    public void SetDonGia(float a){
        this.DonGia = a;
    }
    public float GetDonGia(){
        return this.DonGia;
    }
    
    public void SetID(int a){
        this.Id = a;
    }
    public int GetID(){
        return this.Id;
    }
    
    @Override
    public void Output(){
        System.out.println("Ma khach hang: " + this.GetMaKH());
        System.out.println("Ten khach hang: " + this.GetTenKH());
        System.out.println("So luong dien: " + this.GetSLDien());
    }
}
