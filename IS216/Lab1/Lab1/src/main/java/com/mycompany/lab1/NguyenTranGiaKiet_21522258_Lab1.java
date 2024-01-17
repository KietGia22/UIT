/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.mycompany.lab1;

import java.util.Scanner;
import java.util.Random;
import java.util.Arrays;

/**
 *
 * @author GIA KIET
 */
public class NguyenTranGiaKiet_21522258_Lab1 {
    static Scanner in = new Scanner(System.in);
    static Random rand = new Random();
    public static void Bai9_ThucHanhTrenLop(){
        System.out.print("Nhap so luong phan tu cho mang 1 chieu: ");
        int soluong = in.nextInt();
        int []array = new int[soluong]; 
        for(int i = 0; i < soluong; i++){
           array[i] = rand.nextInt(50);
        }
        System.out.println("Cac phan tu trong mang mot chieu la: " + Arrays.toString(array));
        
        int max = array[0], min = array[0];
        for(int i = 0; i < soluong; i++){
            max = Math.max(max, array[i]);
            min = Math.min(min, array[i]);
        }
        System.out.println("Phan tu lon nhat trong mang la: " + max);
        System.out.println("Phan tu nho nhat trong mang la: " + min);
        
        System.out.print("Nhap so x can tim trong mang: ");
        int x = in.nextInt();
        int index = -1;
        int count = 0;
        for(int i=0; i < soluong; i++){
            if(array[i] == x){
                index = i;
                count++;
            }
        }
        if(index != -1){
            System.out.println(x + " co nam trong mang va nam o vi tri: " + index);
            System.out.println("So lan xuat hien cua x la: " + count);
        }    
        else{
            System.out.println(x + " khong nam trong mang");
            System.out.println("Khong the dem so lan xuat hien cua " + x + " do " + x + " khong xuat hien");
        }
        Arrays.sort(array);
        System.out.println("Mang mot chieu sau khi da sap xep: " + Arrays.toString(array));
    }
    
    public static int Bai1_BTVN(int a, int b){
        if(b == 0)
            return a;
        return Bai1_BTVN(b, a%b);
    }
    
    public static int Bai2_BTVN(int a, int b){
        return (a / Bai1_BTVN(a, b)) * b;
    }
    public static void main(String[] args) {
        //Bai 9
        Bai9_ThucHanhTrenLop();
        //Bai 1 BTVN
        System.out.print("Nhap 2 so a va b: ");
        int so1 = in.nextInt();
        int so2 = in.nextInt();
        int UCLN = Bai1_BTVN(so1, so2);
        System.out.println("Uoc chung lon nhat cua " + so1 + " va " + so2 + " la: " + UCLN);
        //Bai 2 BTVN
        int BCNN = Bai2_BTVN(so1, so2);
        System.out.println("Boi chung nho nhat cua " + so1 + " va " + so2 + " la: " + BCNN);
    }
}
