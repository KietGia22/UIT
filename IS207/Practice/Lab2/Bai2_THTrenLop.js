function CrawlDataOnePage() {
  var resultsArea = document.querySelector('.shopee-search-item-result__items')
  var listResults = resultsArea.querySelectorAll(
    '.shopee-search-item-result__item'
  )
  var listResultsLength = listResults.length

  for (let i = 0; i < listResultsLength; i++) {
    try {
      console.log('-SẢN PHẨM SỐ ' + (i + 1) + ':')
      var aTag = listResults[i].querySelector('a')
      var divL1Tag = aTag.querySelector('div')
      var divL2Tag = divL1Tag.querySelector('div')
      var divFirstL3Tag = divL2Tag.querySelector('div')
      var divSecL3Tag = divFirstL3Tag.nextElementSibling
      var divNameL4Tag = divSecL3Tag.querySelector('div')
      var divPriceL4Tag = divNameL4Tag.nextElementSibling
      var divLocationL4Tag = divPriceL4Tag.nextElementSibling.nextElementSibling
      var productName = divNameL4Tag
        .querySelector('div')
        .querySelector('div').innerHTML
      console.log('Product name: ' + productName)
      var divPrice5Tag = divPriceL4Tag.querySelectorAll('div')
      var NumberDiv = divPrice5Tag.length

      if (NumberDiv === 1) {
        var NumberSpan = divPriceL4Tag.querySelectorAll('span')
        if (NumberSpan != 6) {
          console.log('Product Price: ' + divPrice5Tag[0].textContent)
        } else {
          var first = divPrice5Tag[2].textContent
          var second = divPrice5Tag[5].textContent
          console.log('Product Price: ' + first + '-' + second)
        }
      } else {
        console.log('Product Price(old): ' + divPrice5Tag[0].textContent)
        console.log('Product Price (new): ' + divPrice5Tag[1].textContent)
      }

      console.log('Product location: ' + divLocationL4Tag.textContent)
    } catch (e) {
      continue
    }
  }
}

async function CrawlDataAllPage(n) {
  const sleep = (ms) => new Promise((res) => setTimeout(res, ms))
  for (let i = 1; i <= n; i++) {
    try {
      CrawlDataOnePage()
      console.log('---------Next page please [' + i + '] --------')
      document.querySelector('.shopee-mini-page-controller__next-btn').click()
      await sleep(3000)
    } catch (error) {
      console.log(error)
    }
  }
}
