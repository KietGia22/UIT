
SELECT TenCang, DienTich, NLTQ, NgDi, TenTau
FROM (SELECT SoIMO, NgDi, TenCang, DienTich, NLTQ
	FROM (SELECT TenCang, MaBC, DienTich, NLTQ
		FROM (SELECT SHCB, TenCang
			FROM (SELECT SHCB, TenCang, LoaiCB
				FROM CANGBIEN2) C2
			WHERE LoaiCB = 'Loại 2') Nhanh_1 JOIN
			(SELECT *
			FROM (SELECT SHCB, MaBC
				FROM BENCANG2A) Nhanh_2 JOIN 
				(SELECT MaBC, DienTich, NLTQ
				FROM (SELECT MaBC, CNKT, DienTich, NLTQ
					FROM BENCANG2B) B2B
				WHERE CNKT = 'Tổng hợp') Nhanh_3 ON
				Nhanh_2.MaBC = Nhanh_3.MaBC) Nhanh_23 ON
			Nhanh_1.SHCB = Nhanh_23.SHCB) Nhanh_123 JOIN
		(SELECT SoIMO, MaBC, NgDi
		FROM CAPCANG2
		WHERE NgCap = '29/06/2021') Nhanh_4 ON
		Nhanh_123.MaBC = Nhanh_4.MaBC) Nhanh_1234 JOIN
	(SELECT SoIMO, TenTau
	FROM TAU) Nhanh_5 ON
	Nhanh_1234.SoIMO = Nhanh_5.SoIMO
	
