<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    Ten nguoi nghe <select class="MaNN" name="MaNN">
        <?php
         $conn = include 'connect.php';
         $sql = "Select * from nguoinghe";
         $rs = $conn->query($sql);
         while($row = $rs->fetch_row())
         {
            Echo "<option value='$row[0]'>$row[1]</option>";
         }
        ?>
    </select>
    <br>
    <br>
    <div class="tableplaylist"></div>

    <script>
    const MaNN = document.querySelector(".MaNN");
    MaNN.addEventListener("change", function(e) {
        let ng = this.value;
        console.log(ng.innerHTML);
        let xhr = new XMLHttpRequest()

        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.querySelector('.tableplaylist').innerHTML = xhr.responseText
            }
        }

        xhr.open('GET', 'lietkeplaylist.php?ng=' + ng, true)
        xhr.send()
    })

    document.body.addEventListener("click", (e) => {
        if (e.target.classList.contains("delete-button")) {
            console.log(e.target)
            let parent = e.target.closest("tr")
            console.log(parent)
            let MaPlaylist = parent.querySelector(".MaPlayList").value;
            console.log(parent.querySelector(".MaPlayList"))
            console.log(MaPlaylist)
            let xhrDelete = new XMLHttpRequest();

            xhrDelete.onreadystatechange = function() {
                if (xhrDelete.readyState == 4 && xhrDelete.status == 200) {
                    parent.remove();
                }
            };

            xhrDelete.open("POST", "xoaplaylist.php", true);
            xhrDelete.setRequestHeader(
                'Content-type',
                'application/x-www-form-urlencoded'
            )
            xhrDelete.send(`MaPlayList=${MaPlaylist}`);
        }
    })
    </script>
</body>

</html>