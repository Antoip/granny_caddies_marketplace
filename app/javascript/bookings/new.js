const startDate = document.getElementById("range_start")
const endDate = document.getElementById("range_end")
const price = document.querySelector(".price-antoine")

if (startDate) {
  startDate.addEventListener("change", (event) => {
                           startValue = new Date(startDate.value);
                           endValue = new Date(endDate.value);
                           dateDiff = (endValue - startValue)/1000/3600/24;
                           const initPrice = price.dataset.price
                           if (isNaN(dateDiff)) {
                            price.innerText = initPrice;
                           } else {
                            price.innerText = Number.parseInt(initPrice, 10) * dateDiff;
                           };
                         });

  endDate.addEventListener("change", (event) => {
                           startValue = new Date(startDate.value);
                           endValue = new Date(endDate.value);
                           dateDiff = (endValue - startValue)/1000/3600/24;
                           const initPrice = price.dataset.price
                           if (isNaN(dateDiff)) {
                            price.innerText = initPrice;
                           } else {
                            price.innerText = Number.parseInt(initPrice, 10) * dateDiff;
                           };
                         });
}

