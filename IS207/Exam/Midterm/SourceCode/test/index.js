function display() {
  const input = document.querySelector('.input')
  const img = document.createElement('img')

  if (input.value) {
    let render = new FileReader()
    render.onload = (e) => {
      img.src = e.target.result
    }
    render.readAsDataURL(img.files[0])
    document.body.appendChild(render)
  }
}
