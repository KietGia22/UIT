
import java.util.ArrayList;
import java.util.Scanner;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author GIA KIET
 */
interface INhanVien{
    public double TongLuong();
}

abstract class NhanVien implements INhanVien{
    protected int MaNV;
    protected String TenNV, TenDV;
    protected long MucLuong;
    protected ArrayList<Integer> chamcong;
    
    
    public NhanVien(){}
    public NhanVien(int a, String b, String c, long d){
        this.MaNV = a;
        this.TenNV = b;
        this.TenDV = c;
        this.MucLuong = d;
        this.chamcong = new ArrayList<>();
    }
    
    public void ChamCong(int a){
        chamcong.add(a);
    }
    
}

class NhanVienGianTiep extends NhanVien{
    public NhanVienGianTiep(){}
    public NhanVienGianTiep(int a, String b, String c, long d){
        super(a, b, c, d);
    }
    @Override
    public double TongLuong(){
        double tongluong = 0;
        for(int index : chamcong){
            if(index == 1)
                tongluong += 1 * this.MucLuong;
            else if(index == 0)
                tongluong += 0.5 * this.MucLuong;
        }
        return tongluong;
    }
}

class NhanVienTrucTiep extends NhanVien{
    protected double hesophucap;
    
    public NhanVienTrucTiep(){}
    public NhanVienTrucTiep(int a, String b, String c, long d, double e){
        super(a, b, c, d);
        this.hesophucap = e;
    }
    
    @Override
    public double TongLuong(){
        double tongluong = 0;
        for(int index : chamcong){
            if(index == 1)
                tongluong += 1 * this.MucLuong;
            else if(index == 0)
                tongluong += 0.5 * this.MucLuong;
            else if(index == 2)
                tongluong += 1.5 * this.MucLuong;
        }
        return tongluong * this.hesophucap;
    }
}

public class Main {

     static Scanner in = new Scanner(System.in);
    /**
     * @param nv
     */
    
    public void Input(ArrayList<NhanVien>nv){
        int MaNV;
        String TenNV, TenDV;
        long MucLuong;
        
        OUTER:
        while(true){
            System.out.println("Nhap doi tuong khach hang: \n0.Thoat\n1.Nhan vien gian tiep\n2.Nhan vien truc tiep");
            System.out.print("Nhap lua chon: ");
            int choice = in.nextInt();
            switch(choice){
                case 0:{
                    break OUTER;
                }
                case 1:{
                    do{
                        System.out.print("Nhap ma nhan vien: ");
                        MaNV = in.nextInt();
                        if(CheckNV(MaNV, nv) == false)
                            System.out.println("Vui long nhap lai");
                    }while(CheckNV(MaNV, nv) == false);
                    in.nextLine();
                    System.out.print("Nhap ten nhan vien: ");
                    TenNV = in.nextLine();
                    System.out.print("Nhap ten don vi: ");
                    TenDV = in.nextLine();
                    System.out.print("Nhap muc luong cua nhan vien: ");
                    MucLuong = in.nextLong();
                    NhanVien nvv = new NhanVienGianTiep(MaNV, TenNV, TenDV, MucLuong);
                    nv.add(nvv);
                    System.out.println();
                    break;
                }
                case 2: {
                    do{
                        System.out.print("Nhap ma nhan vien: ");
                        MaNV = in.nextInt();
                        if(CheckNV(MaNV, nv) == false)
                            System.out.println("Vui long nhap lai");
                    }while(CheckNV(MaNV, nv) == false);
                    in.nextLine();
                    System.out.print("Nhap ten nhan vien: ");
                    TenNV = in.nextLine();
                    System.out.print("Nhap ten don vi: ");
                    TenDV = in.nextLine();
                    System.out.print("Nhap muc luong cua nhan vien: ");
                    MucLuong = in.nextLong();
                    System.out.print("Nhap he so phu cap: ");
                    double hesophucap = in.nextDouble();
                    NhanVien nvv = new NhanVienTrucTiep(MaNV, TenNV, TenDV, MucLuong, hesophucap);
                    nv.add(nvv);
                    System.out.println();
                    break;
                }
            }
        }
    }
    
    public boolean CheckNV(int a, ArrayList<NhanVien>nv){
         for(NhanVien nvv : nv){
             if(nvv.MaNV == a)
                 return false;
         }
         return true;
    }
    
    public void Output(ArrayList<NhanVien> nv){
        for(NhanVien nvv : nv){
            System.out.println("MaNV: " + nvv.MaNV);
            System.out.println("TenNV: " + nvv.TenNV);
            System.out.println("So ngay lam viec: " + nvv.chamcong.size());
            System.out.println("Luong thang: " + nvv.TongLuong());
        }
    }
    
    public void ChamCong(ArrayList<NhanVien> nv){
        int maNV;
        String TenNV;
        OUTER:
        while(true){
            System.out.print("0.Dung cham cong\n1.Tiep tuc qua trinh cham cong\nNhap lua chon: ");
            int choice = in.nextInt();
            switch(choice){
                case 0:{
                    break OUTER;
                }
                case 1:{
                    System.out.print("Nhap ma nhan vien muon cham cong: ");
                    maNV = in.nextInt();
                    in.nextLine();
                    System.out.print("Nhap ten nhan vien muon cham cong: ");
                    TenNV = in.nextLine();
                    ChamCongChiTiet(nv, maNV, TenNV);
                    break;
                }
            }
        }
    }
    
    public void ChamCongChiTiet(ArrayList<NhanVien> nv, int a, String b){
        int LamHayNghi;
        System.out.print("Ngay hom do nguoi do lam hay nghi(1 la lam, 0 la nghi, 2 la lam ca 2 voi nguoi lam truc tiep): ");
        LamHayNghi = in.nextInt();
        for(NhanVien nvv : nv){
            if(nvv.TenNV.equals(b) && nvv.MaNV == a)
                nvv.ChamCong(LamHayNghi);
        }
    }
    
    public static void main(String[] args) {
        // TODO code application logic here
        ArrayList<NhanVien> nv = new ArrayList<>();
        Main main = new Main();
        main.Input(nv);
        main.ChamCong(nv);
        main.Output(nv);
    }
    
}
