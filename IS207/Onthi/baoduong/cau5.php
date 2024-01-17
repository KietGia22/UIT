<b>Liet ke</b>
<br>
Chon so lan bao duong <input type="text" name="" id="SolanBD">
<br>
<div id="table-BD"></div>
<br>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#SolanBD').change(function() {
        let solanBD = $(this).val();
        $.ajax({
            method: 'GET',
            url: 'lietkebd.php',
            data: {
                solanBD: solanBD
            },
            success: function(data) {
                $('#table-BD').html(data);
            }
        })
    })
})
</script>