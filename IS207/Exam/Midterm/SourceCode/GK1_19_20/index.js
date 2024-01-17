document.addEventListener('DOMContentLoaded', function () {
  var products = [
    {
      id: 1,
      name: 'Nhà giả kim',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 69000,
      qty: 1,
      totalPrice: 69000,
    },
    {
      id: 2,
      name: 'Khởi nghiệp 4.0',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 139000,
      qty: 1,
      totalPrice: 139000,
    },
    {
      id: 3,
      name: 'Tư duy phản biện',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 85000,
      qty: 1,
      totalPrice: 85000,
    },
    {
      id: 4,
      name: 'Trên đường băng',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 80000,
      qty: 1,
      totalPrice: 80000,
    },
    {
      id: 5,
      name: 'Tokyo hoàng đạo án',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 90000,
      qty: 1,
      totalPrice: 90000,
    },
    {
      id: 6,
      name: 'Biên niên sử thế giới bằng hình',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 330000,
      qty: 1,
      totalPrice: 330000,
    },
    {
      id: 7,
      name: 'Lịch sử thế giới',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 59000,
      qty: 1,
      totalPrice: 59000,
    },
    {
      id: 8,
      name: 'SAPIENS: Lược sử loài người',
      imageUrl:
        'http://isach.info/images/story/cover/nha_gia_kim__paulo_coelho.jpg',
      price: 29000,
      qty: 1,
      totalPrice: 29000,
    },
  ]

  for (var i = 0; i < products.length; i++) {
    var block = document.createElement('div')
    block.classList.add('block')

    var img = document.createElement('img')
    img.src = products[i].imageUrl
    img.style.width = '150px'
    img.style.height = '150px'

    var name = document.createElement('p')
    name.textContent = products[i].name

    var h3 = document.createElement('h3')
    var priceText = document.createTextNode('Giá: ')
    var span = document.createElement('span')
    span.textContent = products[i].price
    h3.appendChild(priceText)
    h3.appendChild(span)

    var button = document.createElement('button')
    button.value = products[i].id
    button.classList.add('btnChonMua')
    button.textContent = 'Chon mua'

    block.appendChild(img)
    block.appendChild(name)
    block.appendChild(h3)
    block.appendChild(button)

    document.getElementById('wrap-products').appendChild(block)
  }

  // Mảng localStorage
  var arrLocalStorage = []
  if (JSON.parse(localStorage.getItem('productsCart'))) {
    arrLocalStorage = JSON.parse(localStorage.getItem('productsCart'))
  }

  // Mảng id
  var arrId = []
  for (var i = 0; i < arrLocalStorage.length; i++) {
    arrId.push(arrLocalStorage[i].id)
  }

  var btnChonMuaElements = document.querySelectorAll('.btnChonMua')

  btnChonMuaElements.forEach(function (btnChonMua) {
    btnChonMua.addEventListener('click', function () {
      console.log('value: ' + this.value)
      for (var i = 0; i < products.length; i++) {
        if (
          this.value == products[i].id &&
          arrId.indexOf(products[i].id) == -1
        ) {
          arrId.push(products[i].id)
          console.log(arrId)
          console.log()
          arrLocalStorage.push(products[i])
          console.log(arrLocalStorage)
          localStorage.setItem('productsCart', JSON.stringify(arrLocalStorage))
        }
      }
    })
  })
})

document.addEventListener('DOMContentLoaded', function () {
  var cartList = JSON.parse(localStorage.getItem('productsCart'))
  console.log(cartList)

  function fetch() {
    var tableCart = document.getElementById('table-cart')
    tableCart.querySelectorAll('.row-item').forEach(function (row) {
      row.remove()
    })

    var tongtien = 0
    for (var i = 0; i < cartList.length; i++) {
      var row = document.createElement('tr')
      row.classList.add('row-item')
      row.innerHTML = `
        <td>${cartList[i].name}</td>
        <td><input type='number' value="${cartList[i].price}" class="price"/></td>
        <td><input type='number' value="${cartList[i].qty}" class="quantity" id="${cartList[i].id}"/></td>
        <td><input type='number' value="${cartList[i].totalPrice}" class="totalPrice"/></td>
        <td><button class="deleteButton" id="${cartList[i].id}">Xóa</button></td>
      `
      tableCart.appendChild(row)
      tongtien = tongtien + cartList[i].totalPrice
    }

    var totalRow = document.createElement('tr')
    totalRow.classList.add('row-item')
    totalRow.innerHTML = `
        <td>Tổng tiền</td>
        <td></td>
        <td colspan="3">${tongtien}</td>
    `
    tableCart.appendChild(totalRow)
  }

  fetch()

  var quantityInputs = document.querySelectorAll('.quantity')
  quantityInputs.forEach(function (quantityInput) {
    quantityInput.addEventListener('change', function (e) {
      var productId = e.target.id
      var tempLength = cartList.length
      for (var i = 0; i < tempLength; i++) {
        if (productId == cartList[i].id) {
          if (parseInt(quantityInput.value) <= 0) {
            fetch()
            location.reload()
            return
          }
          cartList[i].qty = parseInt(quantityInput.value)
          cartList[i].totalPrice =
            parseInt(quantityInput.value) * cartList[i].price
          localStorage.setItem('productsCart', JSON.stringify(cartList))
          fetch()
          location.reload()
        }
      }
    })
  })

  var deleteButtons = document.querySelectorAll('.deleteButton')
  deleteButtons.forEach(function (deleteButton) {
    deleteButton.addEventListener('click', function (e) {
      var productId = e.target.id
      var tempLength = cartList.length
      for (var i = 0; i < tempLength; i++) {
        if (productId == cartList[i].id) {
          var updatedCartList = cartList.filter(function (cartItem) {
            return cartItem.id !== parseInt(e.target.id)
          })
          localStorage.setItem('productsCart', JSON.stringify(updatedCartList))
          fetch()
          location.reload()
        }
      }
    })
  })
})
