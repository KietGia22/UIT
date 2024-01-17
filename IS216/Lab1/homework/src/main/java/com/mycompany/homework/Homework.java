/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.homework;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author GIA KIET
 */
public class Homework {
    static Scanner in = new Scanner(System.in);
    static Random rand = new Random();
    public static void Bai9_P1(){
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
    
    public static void DonGianPS(int a, int b){
        if(b == 0)
            System.out.println("khong the rut gon phan so");
        else {
            int sochung = Bai1_BTVN(a, b);
            System.out.println("Phan so sau khi rut gon la: " + (a / sochung) + "/" + (b/sochung));
        }
    }
    
    public static void UocSo(int n){ 
        System.out.print("Cac uoc cua " + n + " la: ");
        for(int i = 1; i < n; i++){
            if(n % i == 0)
                System.out.print(i + " ");
        }
    }
    
    public static void SoNguyen(int a[], int n){
        int m = in.nextInt();
        int[] b = new int[m];
        for(int i=0; i<m; i++){
            int random = (int) Math.floor(Math.random() * (50+1) + 0);
            b[i] = random;
        }
        
        for(int i=0; i<m; i++){
            System.out.print(b[i] + " ");
        }
        
        int[] c = Arrays.copyOf(a, n);
        System.arraycopy(b,  m-3, c, 1, 3);
        Arrays.sort(c);
        
        System.out.print("\n");
        for(int i = 0; i<c.length; i++){
            System.out.print(c[i] + " ");
        }
    }

    public static void main(String[] args) {
        System.out.println("Hello World!");
        int so1, so2;
        so1 = in.nextInt();
        /*so2 = in.nextInt();
        DonGianPS(so1, so2);
        UocSo(so1);
        System.out.print("\n");*/
        int[] arr = new int[so1];
        for(int i=0; i<so1; i++){
            int input = in.nextInt();
            arr[i] = input;
        }
        SoNguyen(arr, so1);
    }
    
}
