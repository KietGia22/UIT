<form action="update.php" method="POST">
    <b>Thanh toán</b>
    <br>
    Số xe <select name="MABD" id="SOXE">

    </select>
    <br>
    Ngày nhận xe <input type="date" name="" id="NGAYNHAN">
    <br>
    Thành tiền <input type="text" id="ThanhTien" name="THANHTIEN">
    <br>
    <div class="table-cong-viec"></div>
    <br>
    <input type="submit" value="Thanh toán">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $("input[type=date]").change(function() {
        let ngnhan = $('#NGAYNHAN').val();
        $.ajax({
            method: 'GET',
            url: 'loadsoxe.php',
            data: {
                ngnhan: ngnhan
            },
            success: function(data) {
                $("#SOXE").html(data);
            }
        })
    })
    $("body").on('change', '#SOXE', function() {
        let MABD = $('#SOXE').val();
        $.ajax({
            method: 'GET',
            url: 'loadcv.php',
            data: {
                MABD: MABD
            },
            success: function(data) {
                $(".table-cong-viec").html(data)
                var sum = 0;
                $(".DonGia").each(function() {
                    sum += Number($(this).text());
                });
                $("#ThanhTien").val(sum);
            }
        })
    })
    $("body").on('click', '.xoa', function(e) {
        let parent = e.target.closest("tr");
        let MaCV = parent.querySelector('.MACV').value;
        console.log(MaCV);
        let MABD = $('#SOXE').val();
        console.log(MABD)
        $.ajax({
            method: 'POST',
            url: 'xoa.php',
            data: {
                MaCV: MaCV,
                MABD: MABD
            },
            success: function() {
                parent.remove();
            }
        })
    })
})
</script>