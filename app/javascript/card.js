const pay = () => {
  Payjp.setPublicKey('pk_test_cbb80816fa751c87c5e47265')
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    //FormDataオブジェクトとはサーバーにデータを送信するオブジェクト
    const formData = new FormData(formResult);

    const card = {
      //変数cardに定義するオブジェクトの定義
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load", pay)