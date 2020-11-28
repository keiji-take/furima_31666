const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    //FormDataオブジェクトとはサーバーにデータを送信するオブジェクト
    const formData = new FormData(formResult);

    const card = {
      //変数cardに定義するオブジェクトの定義
      number: formData.get("order_trade[number]"),
      cvc: formData.get("order_trade[cvc]"),
      exp_month: formData.get("order_trade[exp_month]"),
      exp_year: `20${formData.get("order_trade[exp_year]")}`,
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
      document.getElementById("exp-month").removeAttribute("name");
      document.getElementById("exp-year").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load", pay)