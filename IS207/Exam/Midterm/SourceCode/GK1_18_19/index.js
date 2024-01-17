const data = [
  {
    id: 1,
    name: 'Hủ tiếu',
    price: 20000,
    qty: 0,
    totalPrice: 0,
  },
  {
    id: 2,
    name: 'Bánh canh',
    price: 30000,
    qty: 0,
    totalPrice: 0,
  },
  {
    id: 3,
    name: 'Bún bò',
    price: 35000,
    qty: 0,
    totalPrice: 0,
  },
]

let choiceFood = document.querySelector('.choice-food')
let btnFood = document.querySelector('.btn-food')

const updateTable = () => {
  choiceFood.style.border = '1px solid'
  choiceFood.innerHTML = ''
  data.forEach((item) => {
    if (item.qty > 0) {
      const row = document.createElement('tr')
      row.innerHTML = `
        <td>${item.id}</td>
        <td>${item.name}</td>
        <td>${item.qty}</td>
        <td>${item.price * item.qty}</td>
      `
      choiceFood.appendChild(row)
    }
  })
}

btnFood.addEventListener('click', function () {
  const selectedFood = document.querySelector('.food-table')
  const selectedFoodId = selectedFood.value

  const food = data.find((item) => item.name === selectedFoodId)
  console.log(food)

  if (food) {
    food.qty += 1
    food.totalPrice = food.price * food.qty
  }

  updateTable()
})
