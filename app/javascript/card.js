const pay = () => {
  Payjp.setPublicKey('pk_test_cbb80816fa751c87c5e47265')
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("イベンと着火")
  });
};
window.addEventListener("load", pay)