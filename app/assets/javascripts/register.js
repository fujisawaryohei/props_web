{
  'use strict';

  const waitLoad = () => {
    return new Promise(resolve => {
      window.addEventListener('DOMContentLoaded', () => {
        resolve(); //DOMcontentがロードされる時、つまりページがマウントされた時
      });
    });
  };

  const blur = (elem, blur) => {
    if (blur) elem.style.filter = 'blur(3px)';
    else elem.style.filter = 'none';
  };

  const display = (elem, set) => {
    elem.style.display = set;
  };

  (async() => {

    await waitLoad();

    let isModalShowing = false;

    const registerButton = document.getElementById('register-btn');
    const loginButton    = document.getElementById('login-btn');
    const passwordButton = document.getElementById('forget-pass-btn');
    const modalList = [...document.getElementsByClassName('modal')];
    const blurList  = [...document.getElementsByClassName('modal-blur')];
    const password_token = location.search;

    function passwordEdit(password_token){
      const modal = document.getElementById('password-edit-modal');
      if(password_token){
        for(const blurElem of blurList){
          blur(blurElem,true);
        }
        display(modal,'block');

        isModalShowing = true;
      }
    };

    registerButton.addEventListener('click', () => {
      const modal = document.getElementById('register-modal');

      for (const blurElem of blurList) {
        blur(blurElem, true);
      }
      display(modal, 'block');

      isModalShowing = true;
    });

    loginButton.addEventListener('click', () => {
      const modal = document.getElementById('login-modal');

      for (const blurElem of blurList) {
        blur(blurElem, true);
      }
      display(modal, 'block');

      isModalShowing = true;
    });

    passwordButton.addEventListener('click',(e)=>{
      e.preventDefault(); //画面遷移を防ぐ
      for(const blurElem of modalList){
        blurElem.style.display = "none";
      }
      const modal = document.getElementById('password-modal');
      for(const blurElem of blurList){
        blur(blurElem,true);
      }
      display(modal,'block');
      isModalShowing = true;
    });

    passwordEdit(password_token);

    for (const modalElem of modalList) {
      modalElem.addEventListener('click', e => {
        if (isModalShowing && password_token) {
          for(const blurElem of blurList){
            blur(blurElem,true);
          }
          display(modal,'block');

          isModalShowing = true;
        } else if(isModalShowing){
          for (const blurElem of blurList) {
            blur(blurElem, false);
          }
          display(modalElem, 'none');

          isModalShowing = false;
        }
        else e.preventDefault();
      });
      const childElem = [...modalElem.children];
      for (const child of childElem) {
        child.addEventListener('click', e => {
          e.stopPropagation();
        });
      }
    }

  })();

}
