/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package cau1;

/**
 *
 * @author GK
 */
public class Cau1_Calculator extends javax.swing.JFrame {

    /**
     * Creates new form Cau1_Calculator
     */
    public Cau1_Calculator() {
        initComponents();
        setSize(420, 550);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton4 = new javax.swing.JButton();
        lbHienThi = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        BtnSo7 = new javax.swing.JButton();
        BtnSo8 = new javax.swing.JButton();
        BtnSo9 = new javax.swing.JButton();
        BtnChia = new javax.swing.JButton();
        BtnSo4 = new javax.swing.JButton();
        BtnSo5 = new javax.swing.JButton();
        BtnSo6 = new javax.swing.JButton();
        BtnNhan = new javax.swing.JButton();
        BtnSo1 = new javax.swing.JButton();
        BtnSo2 = new javax.swing.JButton();
        BtnSo3 = new javax.swing.JButton();
        BtnTru = new javax.swing.JButton();
        BtnXoa = new javax.swing.JButton();
        BtnSo0 = new javax.swing.JButton();
        BtnBang = new javax.swing.JButton();
        BtnCong = new javax.swing.JButton();

        jButton4.setText("jButton4");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Calculator");

        lbHienThi.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        lbHienThi.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        lbHienThi.setText("0");
        lbHienThi.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0), 2));

        jPanel1.setLayout(new java.awt.GridLayout(4, 4, 2, 2));

        BtnSo7.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo7.setText("7");
        BtnSo7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo7ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo7);

        BtnSo8.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo8.setText("8");
        BtnSo8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo8ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo8);

        BtnSo9.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo9.setText("9");
        BtnSo9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo9ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo9);

        BtnChia.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnChia.setText("/");
        BtnChia.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnChiaActionPerformed(evt);
            }
        });
        jPanel1.add(BtnChia);

        BtnSo4.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo4.setText("4");
        BtnSo4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo4ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo4);

        BtnSo5.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo5.setText("5");
        BtnSo5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo5ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo5);

        BtnSo6.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo6.setText("6");
        BtnSo6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo6ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo6);

        BtnNhan.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnNhan.setText("x");
        BtnNhan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnNhanActionPerformed(evt);
            }
        });
        jPanel1.add(BtnNhan);

        BtnSo1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo1.setText("1");
        BtnSo1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo1ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo1);

        BtnSo2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo2.setText("2");
        BtnSo2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo2ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo2);

        BtnSo3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo3.setText("3");
        BtnSo3.setToolTipText("");
        BtnSo3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo3ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo3);

        BtnTru.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnTru.setText("-");
        BtnTru.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnTruActionPerformed(evt);
            }
        });
        jPanel1.add(BtnTru);

        BtnXoa.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnXoa.setText("C");
        BtnXoa.setToolTipText("");
        BtnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnXoaActionPerformed(evt);
            }
        });
        jPanel1.add(BtnXoa);

        BtnSo0.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnSo0.setText("0");
        BtnSo0.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSo0ActionPerformed(evt);
            }
        });
        jPanel1.add(BtnSo0);

        BtnBang.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnBang.setText("=");
        BtnBang.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnBangActionPerformed(evt);
            }
        });
        jPanel1.add(BtnBang);

        BtnCong.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        BtnCong.setText("+");
        BtnCong.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnCongActionPerformed(evt);
            }
        });
        jPanel1.add(BtnCong);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbHienThi, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 467, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(lbHienThi, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 322, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private double kq = 0;
    private String pheptoan = "";
    private int count = 0;
    private String luulai = "";
    
    private void tinh (){
        System.out.println(this.count + " " + this.pheptoan + " " + this.kq + " " + this.luulai);
        if (this.pheptoan.equals("")) this.kq = Double.parseDouble(lbHienThi.getText());
        else{ 
            if (this.pheptoan.equals("+")) this.kq += Double.parseDouble(lbHienThi.getText());
            if (this.pheptoan.equals("-")) this.kq -= Double.parseDouble(lbHienThi.getText());
            if (this.pheptoan.equals("X")) this.kq *= Double.parseDouble(lbHienThi.getText());
            if (this.pheptoan.equals("/")) this.kq /= Double.parseDouble(lbHienThi.getText());
        }
    }
    
    private void XoaSach(){
        if(this.luulai.equals("=")){
            lbHienThi.setText("0");
            this.pheptoan = "";
            this.count = 0;
            this.kq = 0;
        }
    }
    
    private void BtnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnXoaActionPerformed
        // TODO add your handling code here:
        lbHienThi.setText("0");
        this.pheptoan = "";
        this.count = 0;
        this.kq = 0;
    }//GEN-LAST:event_BtnXoaActionPerformed

    private void BtnSo1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo1ActionPerformed
        // TODO add your handling code here:\
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo1.getText());
        }
    }//GEN-LAST:event_BtnSo1ActionPerformed

    private void BtnSo2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo2ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo2.getText());
        }
    }//GEN-LAST:event_BtnSo2ActionPerformed

    private void BtnSo3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo3ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo3.getText());
        }
    }//GEN-LAST:event_BtnSo3ActionPerformed

    private void BtnSo4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo4ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo4.getText());
        }
    }//GEN-LAST:event_BtnSo4ActionPerformed

    private void BtnSo5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo5ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo5.getText());
        }
    }//GEN-LAST:event_BtnSo5ActionPerformed

    private void BtnSo6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo6ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo6.getText());
        }
    }//GEN-LAST:event_BtnSo6ActionPerformed

    private void BtnSo7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo7ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo7.getText());
        }
    }//GEN-LAST:event_BtnSo7ActionPerformed

    private void BtnSo8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo8ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo8.getText());
        }
    }//GEN-LAST:event_BtnSo8ActionPerformed

    private void BtnSo9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo9ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo9.getText());
        }
    }//GEN-LAST:event_BtnSo9ActionPerformed

    private void BtnBangActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnBangActionPerformed
        // TODO add your handling code here:
        tinh();
        lbHienThi.setText(String.valueOf(this.kq));
        count++;
        this.luulai = "=";
        //this.kq = 0;
    }//GEN-LAST:event_BtnBangActionPerformed

    private void BtnCongActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnCongActionPerformed
        // TODO add your handling code here:
        /*tinh();
        this.pheptoan = "+";
        lbHienThi.setText("0");*/
        if(this.count == 0){
            tinh();
            this.pheptoan = "+";
            lbHienThi.setText("0");
        } else {
            this.pheptoan = "+";
            lbHienThi.setText("0");
        }
        this.luulai = "";
    }//GEN-LAST:event_BtnCongActionPerformed

    private void BtnTruActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnTruActionPerformed
        // TODO add your handling code here:
        /*tinh();
        this.pheptoan = "-";
        lbHienThi.setText("0");*/
        if(this.count == 0){
            tinh();
            this.pheptoan = "-";
            lbHienThi.setText("0");
        } else {
            this.pheptoan = "-";
            lbHienThi.setText("0");
        }
        this.luulai = "";
    }//GEN-LAST:event_BtnTruActionPerformed

    private void BtnNhanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnNhanActionPerformed
        // TODO add your handling code here:
        /*tinh();
        this.pheptoan = "X";
        lbHienThi.setText("0");*/
        if(this.count == 0){
            tinh();
            this.pheptoan = "X";
            lbHienThi.setText("0");           
        } else {
            this.pheptoan = "X";
            lbHienThi.setText("0");
        }
        this.luulai = "";
    }//GEN-LAST:event_BtnNhanActionPerformed

    private void BtnChiaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnChiaActionPerformed
        // TODO add your handling code here:
        /*tinh();
        this.pheptoan = "/";
        lbHienThi.setText("0");*/
        if(this.count == 0){
            tinh();
            this.pheptoan = "/";
            lbHienThi.setText("0");
        } else {
            this.pheptoan = "/";
            lbHienThi.setText("0");
        }
        this.luulai = "";
    }//GEN-LAST:event_BtnChiaActionPerformed

    private void BtnSo0ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSo0ActionPerformed
        // TODO add your handling code here:
        XoaSach();
        String gtri = this.lbHienThi.getText();
        if(gtri.length() < 10){
            if(gtri.equals("0"))
                gtri = "";
            this.lbHienThi.setText(gtri + BtnSo0.getText());
        }
    }//GEN-LAST:event_BtnSo0ActionPerformed

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
            java.util.logging.Logger.getLogger(Cau1_Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Cau1_Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Cau1_Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Cau1_Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Cau1_Calculator().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BtnBang;
    private javax.swing.JButton BtnChia;
    private javax.swing.JButton BtnCong;
    private javax.swing.JButton BtnNhan;
    private javax.swing.JButton BtnSo0;
    private javax.swing.JButton BtnSo1;
    private javax.swing.JButton BtnSo2;
    private javax.swing.JButton BtnSo3;
    private javax.swing.JButton BtnSo4;
    private javax.swing.JButton BtnSo5;
    private javax.swing.JButton BtnSo6;
    private javax.swing.JButton BtnSo7;
    private javax.swing.JButton BtnSo8;
    private javax.swing.JButton BtnSo9;
    private javax.swing.JButton BtnTru;
    private javax.swing.JButton BtnXoa;
    private javax.swing.JButton jButton4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lbHienThi;
    // End of variables declaration//GEN-END:variables
}
