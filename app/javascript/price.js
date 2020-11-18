

window.addEventListener('load', function(){
  const changePriceTax = document.getElementById("add-tax-price")
  const changePriceProfit = document.getElementById("profit")
  const pushPrice = document.getElementById("item-price") 

    pushPrice.addEventListener('input', function(){
      const inputValue = pushPrice.value;
      changePriceTax.innerHTML = Math.floor(Number(inputValue)/10);
      changePriceProfit.innerHTML = Number(inputValue) - Number(changePriceTax.innerHTML);

    })

})