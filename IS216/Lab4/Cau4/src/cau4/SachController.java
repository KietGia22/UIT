/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cau4;

import java.util.ArrayList;
/**
 *
 * @author phuon
 */
public class SachController {
    ArrayList<Sach> list;
    
    public SachController(){
        this.list = new ArrayList<>();
    }
    
    public int count(){
        return list.size();
    }
    
    public ArrayList<Sach> getAllSach(){
        return list;
    }

    
    public Sach find(String id){
        for(Sach sach : list){
            if (sach.getMaSach().equalsIgnoreCase(id)){
                return sach;
            }
        }
        return null;
    }
    
    public int add(Sach sach) {
        Sach s_find = find(sach.getMaSach());
        if(s_find == null){
            list.add(sach);
            return 1;
        }
        return -1;
    }
    
    public int del(String id){
        Sach s = find(id);
        if(s!= null){
            list.remove(s);
            return 1;
        }
        return -1;
    }
    
    public Sach getSachAtPoint(int position){
        return list.get(position);
    }
    
    public int edit(Sach s){
        for(Sach sach : list){
            if(sach.getMaSach().equalsIgnoreCase(s.getMaSach())){
                sach.setTenSach(s.getTenSach());
                sach.setGia(s.getGia());
                sach.setTacGia(s.getTacGia());
                sach.setNhaXuatBan(s.getNhaXuatBan());
                return 1;
            }
        }
        return -1;
    }
}
