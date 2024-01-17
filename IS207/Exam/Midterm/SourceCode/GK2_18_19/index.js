document.addEventListener('DOMContentLoaded', function () {
  const addButton = document.querySelector('.a_href')
  const job = document.querySelector('.job')

  if (addButton) {
    addButton.addEventListener('click', () => {
      addButton.remove()
      const newTable = document.createElement('table')
      newTable.className = 'job-table'
      newTable.innerHTML = `
    <tr><td>Vị trí công việc</td>
    <td><input class='pos' type="text" /></td></tr>

    <tr>
    <td>Thời gian</td>
    <td>
      Từ ngày <input class='begin' type="text" />
      <br />
      Đến ngày <input class='end' type="text" />
    </td>
    </tr>

    <tr>
    <td>Mô tả</td>
    <td><textarea class="txt"></textarea></td>
    </tr>
  `
      job.appendChild(newTable)
      job.appendChild(addButton)
    })
  }

  // fileInput.addEventListener('change', function () {
  //   if (fileInput.files.length > 0) {
  //     const filePath = URL.createObjectURL(fileInput.files[0])
  //     console.log(fileInput.value) // In đường dẫn tệp tin lên console
  //   }
  // })

  const btn_regis = document.querySelector('.btn-regis')

  const dataUser = []
  const jobData = []

  if (btn_regis) {
    btn_regis.addEventListener('click', function () {
      const name = document.querySelector('.name').value
      const address = document.querySelector('.address').value
      const phone = document.querySelector('.phone').value
      const email = document.querySelector('.email').value
      const job_td = document.querySelector('.job-td').value
      const fileInput = document.querySelector('.img').value

      if (!name || !address || !phone || !email || !job_td || !fileInput) {
        console.log('Vui lòng điền đầy đủ thông tin.')
        return
      } else {
        const emailRegex = /^\S+@\S+\.\S+$/ // Regex kiểm tra địa chỉ email
        if (!emailRegex.test(email)) {
          console.log('Địa chỉ email không hợp lệ.')
          return
        }

        const phoneRegex = /^[0-9]{10,}$/
        if (!phoneRegex.test(phone)) {
          console.log('Số điện thoại không hợp lệ.')
          return
        }

        const dataUserObj = {
          name: name,
          address: address,
          phone: phone,
          email: email,
          job_td: job_td,
          fileInput: fileInput,
        }

        dataUser.push(dataUserObj)
      }
      localStorage.setItem('dataUser', JSON.stringify(dataUser))

      jobData.length = 0

      const dateRegex = /^\d{2}\/\d{2}\/\d{4}$/
      const jobTables = document.querySelectorAll('.job-table')

      for (const jobTable of jobTables) {
        const pos = jobTable.querySelector('.pos').value
        const begin = jobTable.querySelector('.begin').value
        const end = jobTable.querySelector('.end').value
        const txt = jobTable.querySelector('.txt').value

        if (!pos || !begin || !end || !txt) {
          console.log('Vui lòng điền đầy đủ thông tin.')
          return
        }

        if (dateRegex.test(begin) && dateRegex.test(end)) {
          const jobObject = {
            position: pos,
            begin: begin,
            end: end,
            text: txt,
          }
          jobData.push(jobObject)
        } else {
          console.log('Ngày không hợp lệ. Vui lòng nhập định dạng dd/mm/yyyy.')
          return
        }
      }

      console.log(dataUser)
      console.log(jobData)

      try {
        localStorage.setItem('jobData', JSON.stringify(jobData))
        if (dataUser.length != 0 && jobData) {
          window.location.href = 'Cau2.html'
        }
      } catch (error) {
        console.error('Lỗi khi lưu dữ liệu vào Local Storage:', error)
      }
    })
  }
})

document.addEventListener('DOMContentLoaded', function () {
  const userData = JSON.parse(localStorage.getItem('dataUser'))
  console.log()

  const jobData = JSON.parse(localStorage.getItem('jobData'))
  console.log(jobData)

  const nameUser = document.querySelector('.dataname')
  const addressUser = document.querySelector('.dataAddress')
  const jobUser = document.querySelector('.datajob')
  const emailUser = document.querySelector('.dataEmail')
  const phoneUser = document.querySelector('.dataPhone')

  nameUser.textContent = userData[0].name
  console.log(nameUser.textContent)
})
