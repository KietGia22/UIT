const data = [
  {
    id: 1,
    imgHref: '1.png',
    name: 'EA SPORTS FC 24',
    NSX: 'Electronic Arts',
    price: 1500000,
  },

  {
    id: 2,
    imgHref: '1.png',
    name: 'Liên Quân',
    NSX: 'Electronic Arts',
    price: 1500000,
  },

  {
    id: 3,
    imgHref: '1.png',
    name: 'Liên Minh Huyền Thoại',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
  {
    id: 4,
    imgHref: '1.png',
    name: 'C Ect GoLang',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
  {
    id: 5,
    imgHref: '1.png',
    name: 'Minecraft',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
  {
    id: 6,
    imgHref: '1.png',
    name: 'EA SPORTS FC 24',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
  {
    id: 7,
    imgHref: '1.png',
    name: 'EA SPORTS FC 24',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
  {
    id: 8,
    imgHref: '1.png',
    name: 'EA SPORTS FC 24',
    NSX: 'Electronic Arts',
    price: 1500000,
  },
]

const $ = (x) => document.querySelector(x)

const container = $('.container')

data.forEach((x) => {
  const listItem = document.createElement('li')
  listItem.classList.add('liElement')

  listItem.innerHTML = `
        <h2 class='liElementname'>${x.name}</h2>
        <p>${x.NSX}</p>
        <p class='gia'>${x.price}</p>
        <div id=${x.id} class="liElement-formGroup">
            <h1 class='litext'>Số lượng</h1>
            <input type="number" value="1" class='soluong'/>
            <h1 class='litext'>Chọn mua</h1>
            <input type="checkbox" class='liElementCheckbox' />
        </div>
    `
  container.appendChild(listItem)
})

const btThanhToan = $('.bt-thanhtoan')

btThanhToan.addEventListener('click', () => {
  document.querySelectorAll('.rowdiagame').forEach((item) => item.remove()) // xóa hết những đĩa game đã chọn trước đó

  const name = $('.input_name')
  const phress = $('.input_phoneAddress')

  $('.hoadon_name').innerText = name.value
  $('.hoadon_phoneAddress').innerText = phress.value

  const diskList = Array.from(document.querySelectorAll('.liElement'))
  console.log(diskList)
  const buyList = diskList.filter((li) => {
    const checkbox = li.querySelector('.liElementCheckbox')
    return checkbox.checked
  })

  let total = 0

  buyList.forEach((li) => {
    const ten = li.querySelector('.liElementname').innerText
    const gia = li.querySelector('.gia').innerText
    const soluong = li.querySelector('.soluong').value
    console.log('gia', gia)
    console.log('soluong', soluong)
    const thanhtien = Number.parseInt(gia) * Number.parseInt(soluong)
    total += thanhtien
    const row = document.createElement('tr')
    row.classList.add('rowdiagame')
    row.innerHTML = `
          <td>${ten}</td>
          <td>${soluong}</td>
          <td>${gia}</td>
          <td>${thanhtien}</td>
        `

    $('.renderdiagame').appendChild(row)
  })

  $('.tongtien').innerText = `Tổng tiền:   ${total}`
})
const hoadon = $('.hoadon')
