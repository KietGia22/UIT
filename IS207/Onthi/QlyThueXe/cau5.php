<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    Tên khách <select id="MAKH">
        <?php
        $conn = include "connect.php";
        $sql = "SELECT * FROM khachhang";
        $result = $conn->query($sql);
        while($row = $result->fetch_row())
        {
            echo "<option value='$row[0]'>$row[1]</option>";
        }
    ?>
    </select>
    <br>
    <br>
    Mã hợp đồng <select id="MAHD"></select>
    <div id="danhsachxe"></div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#MAKH').change(function() {
            let makh = $('#MAKH').val();
            $.ajax({
                method: "GET",
                url: "loadhd.php",
                data: {
                    MaKH: makh
                },
                success: function(data) {
                    $('#MAHD').html(data);
                },
                error: function() {
                    alert('Loi roi thang lon')
                }
            })
        });
        $('#MAHD').change(function() {
            let mahd = $('#MAHD').val();
            $.ajax({
                method: "GET",
                url: "loadtablexe.php",
                data: {
                    MaHD: mahd
                },
                success: function(data) {
                    $('#danhsachxe').html(data);
                }
            })
        })
        $('body').on('click', '.xoa', function(e) {
            let parent = e.target.closest("tr");
            let MaXe = parent.querySelector('.MAXE').value;
            console.log(MaXe);
            let MaHD = parent.querySelector('.MAHD').value;
            console.log(MaHD)
            $.ajax({
                method: "POST",
                url: "delete.php",
                data: {
                    MAXE: MaXe,
                    MAHD: MaHD
                },
                success: function(data) {
                    parent.remove();
                },
                error: function() {
                    alert("Loi roi thang lon")
                }
            })
        })

        // $('body').on('click', '.xoa', function(e) {
        //     var parent = $(this).parents('tr');
        //     var MAXE = parent.find('.MAXE').val();
        //     var MAHD = parent.find('.MAHD').val();
        //     $.ajax({
        //         method: "GET",
        //         url: "delete.php",
        //         data: {
        //             MAXE: MAXE,
        //             MAHD: MAHD
        //         },
        //         success: function(data) {
        //             parent.remove();
        //         }
        //     })
        // })
    })
    </script>
</body>

</html>