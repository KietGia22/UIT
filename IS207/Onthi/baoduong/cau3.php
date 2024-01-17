<b>Thêm bảo dưỡng</b>
<form action="thembd.php" method="POST">
    Số xe <input type="text" name="SOXE" id="SOXE" placeholder="51H-XXX.XX">
    <br>
    Họ tên khách hàng <input type="text" id="HOTENKH" placeholder="Trần Anh Hùng">
    <br>
    Mã bảo dưỡng <input type="text" name="MABD" placeholder="BD001">
    <br>
    Số KM <input type="text" name="SOKM" placeholder="20000">
    <br>
    Nội dung <input type="text" name="NOIDUNG" placeholder="Bảo dưỡng 20000">
    <input type="submit" value="Thêm">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#SOXE').change(function() {
        let SOXE = $('#SOXE').val();
        $.ajax({
            method: 'GET',
            url: 'gettenkh.php',
            data: {
                SOXE: SOXE
            },
            success: function(result) {
                $('#HOTENKH').val(result);
            }
        })
    })
})
</script>