/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package cau4;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author GIA KIET
 */
public class QlySach extends javax.swing.JFrame {

    /**
     * Creates new form QlySach
     */
    public QlySach() {
        initComponents();
        SetBanDau();
        setSize(850, 562);
    }

    SachController s_controller = new SachController();
    private int flag = 0;

    public boolean checkValidForm() {
        if (GiaTF.getText().isEmpty() || MaSachTF.getText().isEmpty() || NhaXuatBanTF.getText().isEmpty() || TacGiaTF.getText().isEmpty() || TenSachTF.getText().isEmpty()) {
            return false;
        }
        return true;
    }
    
    public void SetBanDau(){
        DefaultTableModel tbModel = (DefaultTableModel) jTable1.getModel();
        tbModel.setRowCount(0);
        try (BufferedReader reader = new BufferedReader(new FileReader("text.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] rowData = line.split(","); // Assuming comma-separated values, adjust delimiter as needed
                tbModel.addRow(rowData);
            }
        } catch (IOException e) {
            JOptionPane.showMessageDialog(this, "An error occurred while reading the file: " + e.getMessage(),
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModel(Sach s) {
        MaSachTF.setText(s.getMaSach());
        TenSachTF.setText(s.getTenSach());
        GiaTF.setText(("" + s.getGia()));
        NhaXuatBanTF.setText(s.getNhaXuatBan());
        TacGiaTF.setText(s.getTacGia());
    }

    public Sach getModel() {
        Sach sach = new Sach();
        sach.setMaSach(MaSachTF.getText().trim());
        sach.setTenSach(TenSachTF.getText().trim());
        int gia = 0;
        try {
            gia = Integer.parseInt(GiaTF.getText().trim());
        } catch (Exception e) {
            flag = 1;
        }
        sach.setGia(gia);
        sach.setNhaXuatBan(NhaXuatBanTF.getText().trim());
        sach.setTacGia(TacGiaTF.getText().trim());
        return sach;
    }

    public void hienThi() {
        DefaultTableModel tbModel = (DefaultTableModel) jTable1.getModel();
        tbModel.setRowCount(0);
        for (Sach sach : s_controller.getAllSach()) {
            Object[] rowData = new Object[5];
            rowData[0] = sach.getMaSach();
            rowData[1] = sach.getTenSach();
            rowData[2] = sach.getTacGia();
            rowData[3] = sach.getNhaXuatBan();
            rowData[4] = sach.getGia();
            tbModel.addRow(rowData);
        }
    }

    public void macdinh() {
        MaSachTF.setText("");
        TenSachTF.setText("");
        GiaTF.setText("");
        NhaXuatBanTF.setText("");
        TacGiaTF.setText("");
        MaSachTF.setEditable(true);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        MaSachTF = new javax.swing.JTextField();
        TenSachTF = new javax.swing.JTextField();
        GiaTF = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        TacGiaTF = new javax.swing.JTextField();
        NhaXuatBanTF = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        ThemBtn = new javax.swing.JButton();
        XoaBtn = new javax.swing.JButton();
        SuaBtn = new javax.swing.JButton();
        LuuBtn = new javax.swing.JButton();
        TimBtn = new javax.swing.JButton();
        Clearbtn = new javax.swing.JButton();
        ThoatBtn = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Chương trình quản lý sách");

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel1.setText("Thông tin sách");

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setText("Tên Sách");

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setText("Mã Sách");

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setText("Giá");

        MaSachTF.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        TenSachTF.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        GiaTF.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel5.setText("Tác giả");

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel6.setText("Nhà Xuất Bản");

        TacGiaTF.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        NhaXuatBanTF.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Mã sách", "Tên sách", "Tác giả", "NXB", "Giá"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTable1.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent event) {
                if (!event.getValueIsAdjusting()) {
                    int selectedRow = jTable1.getSelectedRow();
                    if (selectedRow != -1) {
                        String Masach = jTable1.getValueAt(selectedRow, 0).toString();
                        String Tensach = jTable1.getValueAt(selectedRow, 1).toString();
                        String Tacgia = jTable1.getValueAt(selectedRow, 2).toString();
                        String Nxb = jTable1.getValueAt(selectedRow, 3).toString();
                        String Gia = jTable1.getValueAt(selectedRow, 4).toString();

                        // Hiển thị thông tin sách lên các ô nhập liệu
                        MaSachTF.setText(Masach);
                        TacGiaTF.setText(Tacgia);
                        TenSachTF.setText(Tensach);
                        NhaXuatBanTF.setText(Nxb);
                        GiaTF.setText(Gia);
                    }
                    MaSachTF.setEditable(false);
                }
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel1.setLayout(new java.awt.GridLayout(1, 0));

        ThemBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        ThemBtn.setText("Thêm");
        ThemBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ThemBtnActionPerformed(evt);
            }
        });

        XoaBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        XoaBtn.setText("Xoá");
        XoaBtn.setToolTipText("");
        XoaBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                XoaBtnActionPerformed(evt);
            }
        });

        SuaBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        SuaBtn.setText("Sửa");
        SuaBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SuaBtnActionPerformed(evt);
            }
        });

        LuuBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        LuuBtn.setText("Lưu");
        LuuBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LuuBtnActionPerformed(evt);
            }
        });

        TimBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        TimBtn.setText("Tìm");
        TimBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TimBtnActionPerformed(evt);
            }
        });

        Clearbtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        Clearbtn.setText("Clear");
        Clearbtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ClearbtnActionPerformed(evt);
            }
        });

        ThoatBtn.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        ThoatBtn.setText("Thoát");
        ThoatBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ThoatBtnActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ThemBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(XoaBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(SuaBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(24, 24, 24)
                .addComponent(LuuBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(TimBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(Clearbtn, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(ThoatBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(14, 14, 14))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ThemBtn, javax.swing.GroupLayout.DEFAULT_SIZE, 50, Short.MAX_VALUE)
                    .addComponent(ThoatBtn, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Clearbtn, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(LuuBtn, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(TimBtn, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(SuaBtn, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(XoaBtn, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(16, 16, 16)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(MaSachTF, javax.swing.GroupLayout.PREFERRED_SIZE, 143, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE))
                                        .addGap(18, 18, 18)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(GiaTF, javax.swing.GroupLayout.PREFERRED_SIZE, 143, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addComponent(TenSachTF, javax.swing.GroupLayout.PREFERRED_SIZE, 143, javax.swing.GroupLayout.PREFERRED_SIZE))))
                                .addGap(248, 248, 248)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(jLabel6))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(TacGiaTF)
                                    .addComponent(NhaXuatBanTF, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(290, 290, 290)
                                .addComponent(jLabel1)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(112, 112, 112)
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jPanel3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 3, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 809, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(MaSachTF, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(13, 13, 13)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TenSachTF, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(TacGiaTF, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(NhaXuatBanTF, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(15, 15, 15)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(GiaTF, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 163, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ThoatBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ThoatBtnActionPerformed
        // TODO add your handling code here:
        int opt = JOptionPane.showConfirmDialog(this, "Do you want to exit?", "Exit Form", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
        if (opt == JOptionPane.YES_OPTION) {
            System.exit(0);
        }
    }//GEN-LAST:event_ThoatBtnActionPerformed

    private void ClearbtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ClearbtnActionPerformed
        // TODO add your handling code here:
        MaSachTF.setEditable(true);
        MaSachTF.setText("");
        TenSachTF.setText("");
        GiaTF.setText("");
        NhaXuatBanTF.setText("");
        TacGiaTF.setText("");
        MaSachTF.isEditable();
    }//GEN-LAST:event_ClearbtnActionPerformed

    private void TimBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TimBtnActionPerformed
        // TODO add your handling code here:
        MaSachTF.setEditable(true);
        if (MaSachTF.getText().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Ban chua nhap ma sach");
        } else {
            Sach sach = s_controller.find(MaSachTF.getText().trim());
            if (sach != null) {
                JOptionPane.showMessageDialog(this, "Tim thay thong tin");
                setModel(sach);
                hienThi();
            } else {
                JOptionPane.showMessageDialog(this, "Khong tim thay sach");
            }
        }
        macdinh();
    }//GEN-LAST:event_TimBtnActionPerformed

    private void XoaBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_XoaBtnActionPerformed
        // TODO add your handling code here:
        MaSachTF.setEditable(true);
        if (MaSachTF.getText().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Ban chua them sach nay");
        } else {
            if (s_controller.del(MaSachTF.getText().trim()) > 0) {
                JOptionPane.showMessageDialog(this, "Xoa thanh cong");
                hienThi();
                ClearbtnActionPerformed(evt);
            } else {
                JOptionPane.showMessageDialog(this, "Khong tim thay ma sach nay");
            }
        }
        macdinh();
    }//GEN-LAST:event_XoaBtnActionPerformed

    private void SuaBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SuaBtnActionPerformed
        // TODO add your handling code here:
        if (!MaSachTF.isEditable()) {
            String ms = MaSachTF.getText();
            String ts = TenSachTF.getText();
            String nxb = NhaXuatBanTF.getText();
            String tg = TacGiaTF.getText();
            String gia = GiaTF.getText();

            if (ms.isEmpty() | ts.isEmpty() | gia.isEmpty() | nxb.isEmpty() | tg.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Vui long dien day du thong tin ");
            }
            try {
                int giasua = Integer.parseInt(gia.trim());
                int result = JOptionPane.showConfirmDialog(this, "Ban co chac chan muon sua thong tin sach", "Sua thong tin", JOptionPane.YES_NO_OPTION);
                if (result == JOptionPane.YES_OPTION) {
                    Sach sach_temp = getModel();
                    s_controller.edit(sach_temp);
                    System.out.println("=>" + sach_temp.toString());
                    hienThi();
                    macdinh();
                }
                MaSachTF.setEditable(true);
            } catch (NumberFormatException ex) {
                String errorMessage = "Vui lòng nhập giá là số thực";
                JOptionPane.showMessageDialog(null, errorMessage, "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Vui long chon mot sach truoc khi sua", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }

    }//GEN-LAST:event_SuaBtnActionPerformed

    private void ThemBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ThemBtnActionPerformed
        // TODO add your handling code here:
        MaSachTF.setEditable(true);
        if (!checkValidForm()) {
            JOptionPane.showMessageDialog(this, "Ban chua nhap du thong tin");
        } else {
            try {
                Sach sach = getModel();
                System.out.println("=>" + sach.toString());
                if (flag == 0) {
                    if (s_controller.add(sach) > 0) {
                        JOptionPane.showMessageDialog(this, "Them thanh cong");
                        hienThi();
                        macdinh();
                    } else {
                        JOptionPane.showMessageDialog(this, "Da co ma sach nay");
                        hienThi();
                    }
                } else {
                    flag = 0;
                    JOptionPane.showMessageDialog(this, "Gia sach phai la gia tri so");
                    hienThi();
                }
            } catch (Exception e) {
                System.out.println("Error " + e.toString());
            }
        }
    }//GEN-LAST:event_ThemBtnActionPerformed

    private void LuuBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_LuuBtnActionPerformed
        // TODO add your handling code here:
        MaSachTF.setEditable(true);
        int result = JOptionPane.showConfirmDialog(this, "Ban co chac chan muon luu thong tin sach", "Luu thong tin", JOptionPane.YES_NO_OPTION);
        if (result == JOptionPane.YES_OPTION) {
            if (jTable1.getRowCount() > 0) {
                try {
                    FileWriter fw = new FileWriter("text.txt");
                    fw.append((String) jTable1.getValueAt(0, 0) + ", ");
                    fw.append((String) jTable1.getValueAt(0, 1) + ", ");
                    fw.append((String) jTable1.getValueAt(0, 2) + ", ");
                    fw.append((String) jTable1.getValueAt(0, 3) + ", ");
                    fw.append(jTable1.getValueAt(0, 4) + "\n");
                    int index = 1;
                    while (index < jTable1.getRowCount()) {
                        fw.append((String) jTable1.getValueAt(index, 0) + ", ");
                        fw.append((String) jTable1.getValueAt(index, 1) + ", ");
                        fw.append((String) jTable1.getValueAt(index, 2) + ", ");
                        fw.append((String) jTable1.getValueAt(index, 3) + ", ");
                        fw.append("" + jTable1.getValueAt(index, 4) + "\n");
                        index++;
                    }
                    fw.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }//GEN-LAST:event_LuuBtnActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(QlySach.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(QlySach.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(QlySach.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(QlySach.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new QlySach().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Clearbtn;
    private javax.swing.JTextField GiaTF;
    private javax.swing.JButton LuuBtn;
    private javax.swing.JTextField MaSachTF;
    private javax.swing.JTextField NhaXuatBanTF;
    private javax.swing.JButton SuaBtn;
    private javax.swing.JTextField TacGiaTF;
    private javax.swing.JTextField TenSachTF;
    private javax.swing.JButton ThemBtn;
    private javax.swing.JButton ThoatBtn;
    private javax.swing.JButton TimBtn;
    private javax.swing.JButton XoaBtn;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
