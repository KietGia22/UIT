document
  .getElementById('registrationForm')
  .addEventListener('submit', function (e) {
    e.preventDefault()
    const nickname = document.getElementById('nickname').value
    const email = document.getElementById('email').value
    const phone = document.getElementById('phone').value
    const password = document.getElementById('password').value
    const fullName = document.getElementById('fullName').value
    const dob = document.getElementById('dob').value
    const gender = document.querySelector('input[name="gender"]:checked')
    const securityQuestion = document.getElementById('securityQuestion').value
    const securityAnswer = document.getElementById('securityAnswer').value

    // Tách ngày, tháng, năm ra
    const dobParts = dob.split('/')
    if (dobParts.length !== 3) {
      alert('Ngày sinh không hợp lệ. Vui lòng nhập đúng định dạng dd/mm/yyyy.')
      return
    }

    const emailRegex = /^\S+@\S+\.\S+$/
    if (emailRegex.test(email)) {
      console.log('Địa chỉ email hợp lệ.')
    } else {
      console.log('Địa chỉ email không hợp lệ.')
    }

    const phoneRegex = /^[0-9]{10,}$/
    if (phoneRegex.test(phoneNumber)) {
      console.log('Số điện thoại hợp lệ.')
    } else {
      console.log('Số điện thoại không hợp lệ.')
    }

    const day = parseInt(dobParts[0], 10)
    const month = parseInt(dobParts[1], 10)
    const year = parseInt(dobParts[2], 10)

    // Kiểm tra tính hợp lệ của ngày tháng năm
    if (
      isNaN(day) ||
      isNaN(month) ||
      isNaN(year) ||
      day < 1 ||
      day > 31 ||
      month < 1 ||
      month > 12 ||
      year < 1900
    ) {
      alert('Ngày sinh không hợp lệ. Vui lòng kiểm tra lại.')
      return
    }

    // Kiểm tra đáp án câu hỏi bí mật có đủ 5 ký tự không
    if (securityAnswer.length < 5) {
      alert('Đáp án cho câu hỏi bí mật phải có ít nhất 5 ký tự.')
      return
    }

    // Gửi dữ liệu đăng ký (hoặc xử lý dữ liệu ở đây)
    console.log('Thông tin đăng ký:')
    console.log('Nickname:', nickname)
    console.log('Email:', email)
    console.log('Số điện thoại:', phone)
    console.log('Mật khẩu:', password)
    console.log('Họ tên:', fullName)
    console.log('Ngày sinh:', dob)
    console.log('Giới tính:', gender.value)
    console.log('Câu hỏi bí mật:', securityQuestion)
    console.log('Đáp án câu hỏi bí mật:', securityAnswer)
  })

document
  .getElementById('registrationForm')
  .addEventListener('reset', function () {
    // Xóa nội dung trong các trường input khi nhấn nút Reset
    document.getElementById('nickname').value = ''
    document.getElementById('email').value = ''
    document.getElementById('phone').value = ''
    document.getElementById('password').value = ''
    document.getElementById('fullName').value = ''
    document.getElementById('dob').value = ''
    document.querySelector('input[name="gender"]:checked').checked = false
    document.getElementById('securityAnswer').value = ''
  })
