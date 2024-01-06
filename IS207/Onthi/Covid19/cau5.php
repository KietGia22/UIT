Ten diem cach ly <select name="TenDCL" id="Madcl">
    <?php
        $conn = include 'connect.php';
        $sql = "select * from diemcachly";
        $rs = $conn->query($sql);
        while($row = $rs->fetch_row()){
            echo "<option value='$row[0]'>$row[1]</option>";
        }
    ?>
</select>
<br>
Ten cong dan <select name="TenCD" id="tencd"></select>
<br>
<b>Danh sach cac trieu chung</b>
<br>
<div class="table-trch"></div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $('#Madcl').change(function() {
        let Madcl = $('#Madcl').val();
        console.log(Madcl);
        $.ajax({
            method: 'GET',
            url: 'TenCD.php',
            data: {
                madcl: Madcl
            },
            success: function(data) {
                $('#tencd').html(data);
            }
        })
    })

    $('#tencd').change(function() {
        let macd = $('#tencd').val();
        console.log(macd);
        $.ajax({
            method: 'GET',
            url: 'TableTrieuChung.php',
            data: {
                macd: macd
            },
            success: function(data) {
                $('.table-trch').html(data);
            }
        })
    })
})
</script>