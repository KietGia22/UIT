<table border="1">
    <tr>
        <th>STT</th>
        <th>Ten cong dan</th>
        <th>Gioi tinh</th>
        <th>Nam sinh</th>
        <th>Nuoc ve</th>
        <th>Chuc nang</th>
    </tr>
    <?php 
        $conn = include 'connect.php';
        $sql = "select * from congdan";
        $rs = $conn->query($sql);
        $i = 0;
        while($row = $rs->fetch_row()){
            $i += 1;
            echo "<tr>
                <td>$i</td>
                <td>$row[1]</td>";
            if($row[2] == 1){
                $row[2] = 'Nam';
            } else { 
                $row[2] = 'Nữ';
            }
        echo"<td name='gioitinh'>$row[2]</td>
            <td>$row[3]</td>
            <td >$row[4]</td>";
        echo "<td><a href='#' class='view'>View</a> 
             <button class='delete'>Delete</button>
             <input type='hidden' class='macd' value='$row[0]'>
              </td></tr>";
        }
    ?>
</table>
<br>
<div class="form-update"></div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $('.delete').click(function(e) {
        let parent = e.target.closest("tr");
        let macd = parent.querySelector('.macd').value
        console.log(macd);
        $.ajax({
            method: 'POST',
            url: 'xoaCau3.php',
            data: {
                macd: macd
            },
            success: function(data) {
                parent.remove()
            }
        })
    })

    $('.view').click(function(e) {
        let parent = e.target.closest("tr");
        let macd = parent.querySelector('.macd').value
        console.log(macd);
        $.ajax({
            method: 'POST',
            url: 'View.php',
            data: {
                macd: macd
            },
            success: function(data) {
                $('.form-update').html(data);
            }
        })
    })
})
</script>