Ma hoa don <select name="MaHd" id="MaHD">
</select>
<br>
<b>Danh sach cac phong con trong</b>
<br>
<div class="phong-trong"></div>
<br>
<b>Danh sach cac phong da thue</b>
<br>
<div class="phong-thue"></div>
<br>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $.ajax({
        method: 'GET',
        url: "ThemMaHD.php",
        success: function(data) {
            $("#MaHD").html(data);
        }
    })

    $.ajax({
        method: 'GET',
        url: "PhongTrong.php",
        success: function(data) {
            $(".phong-trong").html(data);
        }
    })

    $('#MaHD').change(function() {
        let MaHD = $('#MaHD').val();
        console.log(MaHD);
        $.ajax({
            method: 'GET',
            url: 'PhongDaDat.php',
            data: {
                mahd: MaHD
            },
            success: function(data) {
                $('.phong-thue').html(data);
            }
        })
    })

    $("body").on('click', '.them-thue', function(e) {
        let MaHD = $('#MaHD').val();
        let parent = e.target.closest('tr');
        console.log(parent);
        let MaP = parent.querySelector('.MaP').value;
        console.log(MaP);
        $.ajax({
            method: 'POST',
            url: 'ThemThue.php',
            data: {
                mahd: MaHD,
                map: MaP
            },
            success: function(data) {
                parent.remove();
            }
        })
    })

    $("body").on('click', '.xoa-thue', function(e) {
        let MaHD = $('#MaHD').val();
        let parent = e.target.closest('tr');
        console.log(parent);
        let MaP = parent.querySelector('.MaP').value;
        console.log(MaP);
        $.ajax({
            method: 'POST',
            url: 'XoaThue.php',
            data: {
                mahd: MaHD,
                map: MaP
            },
            success: function(data) {
                parent.remove();
            }
        })
    })
})
</script>