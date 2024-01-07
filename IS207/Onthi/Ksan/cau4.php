So luong khach hang <input type="text" name="sl-kh" id="sl-kh">
<br>
<b>3 khach hang co so tien thue nhieu nhat</b>
<br>
<div class="thue-nhieu"></div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $('#sl-kh').keydown(function(e) {
        if (e.which == 13) {
            let sl = $('#sl-kh').val();
            console.log(sl);
            $.ajax({
                method: 'GET',
                url: 'SLKH.php',
                data: {
                    sl: sl
                },
                success: function(data) {
                    console.log(data)
                    $('.thue-nhieu').html(data);
                }
            })
        }
    })
})
</script>