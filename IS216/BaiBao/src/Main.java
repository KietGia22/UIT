
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

interface IA{
    public boolean KT();
    public void Xuat();
}

abstract class A implements IA{
    protected String ma, ten;
    protected ArrayList<String>BB;
    
    public A(){}
    public A(String a, String b){
        this.ma = a;
        this.ten = b;
        BB = new ArrayList<>();
    }
    
    public double TinhTB(){
        double diemTB = 0;
        for(String index : BB){
            if(index.equals("A"))
                diemTB += 10;
            else if(index.equals("B"))
                diemTB += 8;
            else 
                diemTB += 6;
        }
        return diemTB;
    }
}

class GV extends A{
    protected String KhoaCT , HocVi;
    
    public GV(){}
    public GV(String a, String b, String c, String d){
        super(a, b);
        this.KhoaCT = c;
        this.HocVi = d;
    }
    @Override
    public double TinhTB(){
        double TB = super.TinhTB();
        if(this.HocVi.equals("GS"))
            return TB*0.1;
        else if(this.HocVi.equals("PGS"))
            return TB*0.15;
        else 
            return TB*0.3;
    }
    @Override
    public boolean KT(){
        double TB = TinhTB();
        if(TB > 8.5)
            return true;
        return false;
    }
    @Override
    public void Xuat(){
        System.out.println("Ma GV: " + ma);
        System.out.println("Ten GV: " + ten);
        System.out.println("Khoa cong tac: " + KhoaCT);
        System.out.println("Hoc vi: " + HocVi);
        System.out.println("Bai Bao: ");
        for(String index : BB){
            System.out.println("+" + index);
        }
        System.out.println("So diem: " + this.TinhTB());
    }
}

class SV extends A{
    public SV(){}
    public SV(String a, String b){
        super(a, b);
    }
    @Override
    public double TinhTB(){
        return super.TinhTB();
    }
    @Override
    public boolean KT(){
        double TB = TinhTB();
        if(TB > 7)
            return true;
        return false;
    }
    @Override
    public void Xuat(){
        System.out.println("Ma SV: " + ma);
        System.out.println("Ten SV: " + ten);
        System.out.println("Bai Bao: ");
        for(String index : BB){
            System.out.println("+" + index);
        }
        System.out.println("So diem: " + this.TinhTB());
    }
}

public class Main {

    static Scanner in = new Scanner(System.in);
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ArrayList<A>ds = new ArrayList<>();
        Main main = new Main();
        main.Input(ds);
        main.HanhDongThemBB(ds);
        for(int i=0; i<ds.size(); i++){
            ds.get(i).Xuat();
        }
    }
    public void Input(ArrayList<A>ds){
        String ma, ten;
        
        OUTER:
        while(true){
            System.out.println("Bang lua chon: \n0.Thoat\n1.GV\n2.SV");
            System.out.print("Nhap lua chon: ");
            int choice = in.nextInt();
            switch(choice){
                case 0:{
                    break OUTER;
                }
                case 1:{
                    in.nextLine();
                    do{
                        System.out.print("Nhap ma giao vien: ");
                        ma = in.nextLine();
                        if(CheckNV(ma, ds) == false)
                            System.out.println("Vui long nhap lai");
                    }while(CheckNV(ma, ds) == false);
                    System.out.print("Nhap ten giang vien: ");
                    ten = in.nextLine();
                    System.out.print("Nhap Khoa cong tac: ");
                    String KhoaCT = in.nextLine();
                    System.out.print("Nhap hoc vi: ");
                    String HocVi = in.nextLine();
                    A a = new GV(ma, ten, KhoaCT, HocVi);
                    ds.add(a);
                    System.out.println();
                    break;
                }
                case 2: {
                    in.nextLine();
                    do{
                        System.out.print("Nhap ma sinh vien: ");
                        ma = in.nextLine();
                        if(CheckNV(ma, ds) == false)
                            System.out.println("Vui long nhap lai");
                    }while(CheckNV(ma, ds) == false);
                    System.out.print("Nhap ten sinh vien: ");
                    ten = in.nextLine();
                    A a = new SV(ma, ten);
                    ds.add(a);
                    System.out.println();
                    break;
                }
            }
        }
    }
    
    public boolean CheckNV(String a, ArrayList<A>ds){
         for(A nvv : ds){
             if(nvv.ma.equals(a))
                 return false;
         }
         return true;
    }
    
    public void ThemBB(ArrayList<A>ds, String m1a){
        String loaiBB;
        System.out.print("Nhap loai bb: ");
        loaiBB = in.nextLine();
        for(A index : ds){
            if(index.ma.equals(m1a))
                index.BB.add(loaiBB);
            else 
                System.out.println("ko thay");
        }
    }
    
    public void HanhDongThemBB(ArrayList<A>ds){
        String ma, ten;
        OUTER:
        while(true){
            System.out.print("0.Dung nhap bai bao\n1.Tiep tuc qua trinh nhap bai bao\nNhap lua chon: ");
            int choice = in.nextInt();
            switch(choice){
                case 0:{
                    break OUTER;
                }
                case 1:{
                    in.nextLine();
                    System.out.print("Nhap ma: ");
                    ma = in.nextLine();
                    ThemBB(ds, ma);
                    break;
                }
            }
        }
    }
    
}
