/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.bai5_btvn;
import java.util.TreeMap;
import java.util.Scanner;
import java.util.Comparator;
import java.util.Set;

class Tu{
    protected String TuTiengAnh;
    protected String LoaiTu;
    protected String Nghia;
    protected String GhiChu;
  
    public Tu(){}
    public Tu(String TuTiengAnh, String LoaiTu, String Nghia, String GhiChu){
        this.TuTiengAnh = TuTiengAnh;
        this.LoaiTu = LoaiTu;
        this.Nghia = Nghia;
        this.GhiChu = GhiChu;
    }

    public void setTu(String a){
        this.TuTiengAnh = a;
    }
    
    public String getTu(){
        return this.TuTiengAnh;
    }
    
    public void setLoai(String a){
        this.LoaiTu = a;
    }
    
    public String getloai(){
        return this.LoaiTu;
    }
    
    public void setNghia(String a){
        this.Nghia = a;
    }
    
    public String getnghia(){
        return this.Nghia;
    }
    
    public void setGhiChu(String a){
        this.GhiChu = a;
    }
    
    public String getGhiChu(){
        return this.GhiChu;
    }
    
    @Override
    public String toString(){
        return this.TuTiengAnh + "(" + this.LoaiTu + "): " + this.Nghia + ". Ghi Chu: " + this.GhiChu;
    }
}

/**
 *
 * @author GIA KIET
 */

class Sortbyroll implements Comparator<Tu> {
 
    // Used for sorting in ascending order of
    // roll number
    @Override
    public int compare(Tu a, Tu b)
    {
        return a.getTu().compareTo(b.getTu());
    }
}

class TuDien{
    Scanner in = new Scanner(System.in);
    TreeMap<Tu, Integer> map = new TreeMap<Tu, Integer>(new Sortbyroll());
    public Tu dictionary;
    public TuDien(){}
    
    public void KhoiTaoTuDien(){
        map.put(new Tu("apple", "noun", "trai tao", "khong"), 1);
        map.put(new Tu("beautiful", "adj", "xinh dep", "khong"), 1);
        map.put(new Tu("can", "noun", "lon", "khong"), 1);
        map.put(new Tu("committee", "noun", "uy ban", "khong"), 1);
        map.put(new Tu("ask", "verb", "hoi", "khong"), 1);
        map.put(new Tu("do", "verb", "lam", "khong"), 1);
        map.put(new Tu("know", "verb", "hieu biet", "khong"), 1);
        map.put(new Tu("difficult", "adj", "kho khan", "khong"), 1);
        map.put(new Tu("emotional", "adj", "xuc dong", "khong"), 1);
        map.put(new Tu("pneumonoultramicroscopicsilicovolcanoconiosis", "noun", "benh ho di ung do hit nhieu bui", "hoi dai"), 1);
    }
    
    public void ThemTu(){
       System.out.print("Nhap tu tieng anh: ");
       String tu = in.nextLine();
       System.out.print("Nhap nghia cua tu: ");
       String nghia = in.nextLine();
       System.out.print("Nhap loai cua tu: ");
       String loai = in.nextLine();
       System.out.print("Nhap chu thich: ");
       String chuthich = in.nextLine();
       dictionary = new Tu(tu.toLowerCase(), loai.toLowerCase(), nghia.toLowerCase(), chuthich.toLowerCase());  
       CheckTuNhap(tu, dictionary);
    }
    
    public void CheckTuNhap(String tuNhap, Tu tu){
        Set<Tu> keySet = map.keySet();
        if(map.isEmpty() ==  true)
            map.put(tu, 1);
        else {
            for(Tu key : keySet){
                if(key.getTu().toLowerCase().equals(tuNhap.toLowerCase()))
                {
                    System.out.println("Tu da ton tai trong tu dien");
                    break;
                }
            }
        }
        map.put(tu, 1);
    }
    
    public void TraTu(String tuCanTim){
        Set<Tu> keySet = map.keySet();
        int oke = 0;
        for(Tu key : keySet){
            if(key.getTu().toLowerCase().equals(tuCanTim.toLowerCase())){
                System.out.println(key);
                oke = 1;
            }
        }
        if(oke == 0)
            System.out.println("Khong tim thay tu trong tu dien");
    }
    
    public void InTatCaCacTu(){
        for(Tu tu : map.keySet()){
            System.out.println(tu);
        }
    }

}

public class Bai5_BTVN {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        TuDien tudien = new TuDien();
        tudien.KhoiTaoTuDien();
        OUTER:
        while(true){
           System.out.println();
           System.out.println("Nhap lua chon: \n0.Thoat\n1.Them tu moi\n2.Tra tu trong tu dien\n3.In het");
           System.out.print("Nhap lua chon: ");
           int choice = in.nextInt();
           switch(choice){
               case 0: {
                   break OUTER;
               }
               case 1: {
                   tudien.ThemTu();
                   break;
               }
               case 2: {
                   in.nextLine();
                   System.out.print("Nhap tu can tim: ");
                   String tuCanTim = in.nextLine();
                   System.out.println();
                   tudien.TraTu(tuCanTim);
                   System.out.println();
                   break;
               }
               case 3: {
                   System.out.println();
                   tudien.InTatCaCacTu();
                   break;
               }
           }
        } 
    }
}
