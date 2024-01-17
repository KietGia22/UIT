const data = [
  {
    id: 1,
    drink: 'Cà phê đá',
    qty: 0,
    price: 15000,
    totalPrice: 0,
  },
  {
    id: 2,
    drink: 'Cà phê sữa',
    qty: 0,
    price: 20000,
    totalPrice: 0,
  },
  {
    id: 3,
    drink: 'Cam vắt',
    qty: 0,
    price: 30000,
    totalPrice: 0,
  },
  {
    id: 4,
    drink: 'Chanh muối',
    qty: 0,
    price: 20000,
    totalPrice: 0,
  },
  {
    id: 5,
    drink: 'Nước ngọt',
    qty: 0,
    price: 15000,
    totalPrice: 0,
  },
  {
    id: 6,
    drink: 'Nước suối',
    qty: 0,
    price: 10000,
    totalPrice: 0,
  },
]

let choiceDrink = document.querySelector('.choice-drink')
let btn_TT = document.querySelector('.btn-TT')

const updateTable = () => {
  choiceDrink.style.border = '1px solid'
  choiceDrink.innerHTML = ``

  let radioBtn = document.getElementsByName('buoi')
  let thanhtien = 0
  let index = 0

  let Sang_or_toi = ``
  for (let i = 0; i < radioBtn.length; i++) {
    if (radioBtn[i].checked) {
      Sang_or_toi = radioBtn[i].value
      break
    }
  }
  const first_row = document.createElement('tr')
  first_row.innerHTML = `
      <th>STT</th>
      <th>Các món đã chọn</th>
      <th>Tiền</th>
    `
  choiceDrink.appendChild(first_row)
  data.forEach((item) => {
    if (item.qty > 0) {
      const row = document.createElement('tr')
      let total = item.price * item.qty
      row.innerHTML = `
        <td>${++index}</td>
        <td>${item.drink}</td>
        <td>${total}</td>
      `
      thanhtien += total
      choiceDrink.appendChild(row)
    }
  })

  if (Sang_or_toi != 'Ban ngày') {
    thanhtien *= 1.2
  }
  const last_row = document.createElement('tr')
  last_row.innerHTML = `
    <th colspan="2">Tổng tiền</th>
    <th>${thanhtien}</th>
  `
  choiceDrink.appendChild(last_row)
}

btn_TT.addEventListener('click', () => {
  const selectedDrink = document.querySelector('.drinkTable')
  const selectedDrinkId = selectedDrink.value

  const drink = data.find((item) => item.drink === selectedDrinkId)

  console.log(drink)

  if (drink) {
    drink.qty += 1
  }

  const radioBanNgay = document.getElementById('banNgay')
  const radioBanDem = document.getElementById('banDem')

  radioBanNgay.addEventListener('click', updateTable)
  radioBanDem.addEventListener('click', updateTable)

  updateTable()
})
