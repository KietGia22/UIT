Ten khach hang <select name="TenKH" id="MaKH"></select>
<br>
Ma hoa don <select name="MaHD" id="MaHD"></select>
<br>
<b>Danh sach cac phong trong hoa don</b>
<br>
<div class="dsphong"></div>
<br>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $.ajax({
        method: 'GET',
        url: 'ThemTenKH.php',
        success: function(data) {
            $("#MaKH").html(data);
        }
    })

    $('#MaKH').click(function() {
        let makh = $("#MaKH").val();
        $.ajax({
            method: 'GET',
            url: 'ThemMAHD_1.php',
            data: {
                makh: makh
            },
            success: function(data) {
                console.log(data);
                $('#MaHD').html(data);
            }
        })
    })

    $('#MaHD').click(function() {
        let mahd = $("#MaHD").val();
        $.ajax({
            method: 'GET',
            url: 'DSPhong.php',
            data: {
                mahd: mahd
            },
            success: function(data) {
                console.log(data);
                $('.dsphong').html(data);
            }
        })
    })
})
</script>