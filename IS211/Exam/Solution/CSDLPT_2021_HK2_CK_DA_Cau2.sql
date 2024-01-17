--Câu 2:
--a)
/* Mức 1: */
read(terminal, $TenVM);
SELECT B.MaBC, B.TenBC, B.CNKT into $MaBC, $TenBC, $CNKT
FROM BENCANG B, CANGBIEN C, VUNGMIEN V
WHERE B.SHCB = C.SHCB
  AND C.MaVM = V.MaVM
  AND V.TenVM = $TenVM;
if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT)
else write(terminal, 'Not Found');

/* Mức 3: */
/* Cách 1 */
read(terminal, $TenVM);
SELECT B.MaBC, B.TenBC, B.CNKT into $MaBC, $TenBC, $CNKT
FROM BENCANG1 B at site MB, CANGBIEN1 C at site MB, VUNGMIEN1 V at site MB
WHERE B.SHCB = C.SHCB
  AND C.MaVM = V.MaVM
  AND V.TenVM = $TenVM;
if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
else
begin
    SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
    FROM BENCANG2A BA at site MT, BENCANG2B BB at site MT, CANGBIEN2 C at site MT, VUNGMIEN2 V at site MT
    WHERE BA.MaBC = BB.MaBC
      AND BA.SHCB = C.SHCB
      AND C.MaVM = V.MaVM
      AND V.TenVM = $TenVM;
    if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
    else
    begin
        SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
        FROM BENCANG3A BA at site MN, BENCANG3B BB at site MN, CANGBIEN3 C at site MN, VUNGMIEN3 V at site MN
        WHERE BA.MaBC = BB.MaBC
          AND BA.SHCB = C.SHCB
          AND C.MaVM = V.MaVM
          AND V.TenVM = $TenVM;
        if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
        else write(terminal, 'Not Found');
    end
end

/* Cách 2 */
read(terminal, $TenVM);
case $TenVM of
    'Miền Bắc': SELECT B.MaBC, B.TenBC, B.CNKT into $MaBC, $TenBC, $CNKT
                FROM BENCANG1 B at site MB;
    'Miền Trung': SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
                  FROM BENCANG2A BA at site MT, BENCANG2B BB at site MT
                  WHERE BA.MaBC = BB.MaBC;
    'Miền Nam': SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
                FROM BENCANG3A BA at site MN, BENCANG3B BB at site MN
                WHERE BA.MaBC = BB.MaBC;
end;
if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
else write(terminal, 'Not Found');

/* Cách 3 */
read(terminal, $TenVM);
SELECT *
FROM VUNGMIEN1 V at site MB
WHERE V.TenVM = $TenVM;
if #FOUND then
begin
    SELECT B.MaBC, B.TenBC, B.CNKT into $MaBC, $TenBC, $CNKT
    FROM BENCANG1 B at site MB;
    if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
    else write(terminal, 'Not Found');
end
else
begin
    SELECT *
    FROM VUNGMIEN2 V at site MT
    WHERE V.TenVM = $TenVM;
    if #FOUND then
    begin
        SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
        FROM BENCANG2A BA at site MT, BENCANG2B BB at site MT
        WHERE BA.MaBC = BB.MaBC;
        if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
        else write(terminal, 'Not Found');
    end
    else
    begin
        SELECT *
        FROM VUNGMIEN3 V at site MN
        WHERE V.TenVM = $TenVM;
        if #FOUND then
        begin
            SELECT BA.MaBC, BA.TenBC, BB.CNKT into $MaBC, $TenBC, $CNKT
            FROM BENCANG3A BA at site MN, BENCANG3B BB at site MN
            WHERE BA.MaBC = BB.MaBC;
            if #FOUND then write(terminal, $MaBC, $TenBC, $CNKT);
            else write(terminal, 'Not Found');
        end
        else write(terminal, 'Not Found');
    end
end

--b)
/* Mức 1: */
read(terminal, $SHCB)
UPDATE CANGBIEN
SET LoaiCB = 'Loại 3'
FROM VUNGMIEN VM
WHERE CANGBIEN.MaVM = VM.MaVM
  AND VM.TenVM = 'Miền Bắc'
  AND CANGBIEN.SHCB = $SHCB;
  
/* Mức 3: */
read(terminal, $SHCB)
UPDATE CANGBIEN1 at site MB
SET LoaiCB = 'Loại 3'
WHERE SHCB = $SHCB;
