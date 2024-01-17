const data = [
  {
    id: 1,
    name: 'Ti vi',
    img_href: 'tivi.jpg',
    qty: 0,
    price: 12000000,
  },
  {
    id: 2,
    name: 'Tủ lạnh',
    img_href: 'tulanh.jpg',
    qty: 0,
    price: 10000000,
  },
  {
    id: 3,
    name: 'Máy giặt',
    img_href: 'maygiat.jpg',
    qty: 0,
    price: 13000000,
  },
]

data.forEach((element) => {
  console.log(element)
})

const image = document.querySelector('.image')
const table = document.querySelector('.table')

image.style.display = 'grid'
image.style.gridTemplateColumns = 'repeat(3, 1fr)'
image.style.columnGap = '50px'
image.style.rowGap = '20px'
image.style.width = '1150px'
image.style.margin = '66px auto'
image.style.margin = '66px auto'

let count = 0

data.forEach((ele) => {
  const div_ele = document.createElement('div')
  const ele_img = document.createElement('img')
  const ele_price = document.createElement('p')
  const ele_btn = document.createElement('button')

  ele_img.src = ele.img_href
  ele_img.style.margin = '5px'
  ele_price.textContent = `Giá: ${ele.price} (đồng)`
  ele_price.style.margin = '5px'
  ele_btn.textContent = 'Thêm vào giỏ hàng'
  ele_btn.style.margin = '5px'
  ele_btn.style.padding = '5px'
  ele_btn.className = 'btn_them'

  div_ele.classList = `${++count}`
  div_ele.appendChild(ele_img)
  div_ele.appendChild(ele_price)
  div_ele.appendChild(ele_btn)
  image.appendChild(div_ele)
})

const updateTable = () => {
  const table_choice = document.querySelector('.table-choice')
  table_choice.style.border = '1px solid'
  table_choice.innerHTML = ''
  const first_row = document.createElement('tr')
  first_row.innerHTML = `
        <th>Các mặt hàng đã chọn</th>
        <th>Số lượng</th>
        <th>Giá</th>
        <th>Chức năng</th>
      `
  table_choice.appendChild(first_row)
  data.forEach((item) => {
    if (item.qty > 0) {
      const row = document.createElement('tr')
      row.innerHTML = `
        <td>${item.name}</td>
        <td>${item.qty}</td>
        <td>${item.price * item.qty}</td>
        <td></td>
      `
      const btn_del = document.createElement('button')
      btn_del.textContent = 'Delete'
      btn_del.addEventListener('click', function () {
        item.qty = 0
        updateTable()
      })

      row.querySelector('td:last-child').appendChild(btn_del)

      table_choice.appendChild(row)
    }
  })
}

const btns = document.querySelectorAll('.btn_them')

btns.forEach((btn) => {
  btn.addEventListener('click', function () {
    const parentDiv = btn.closest('div')
    const divClass = parentDiv.className

    const furni = data.find((item) => item.id == divClass)

    if (furni) {
      furni.qty += 1
    }
    updateTable()
  })
})
