{
  'use strict';

  const waitLoad = () => {
    return new Promise(resolve => {
      window.addEventListener('DOMContentLoaded', () => {
        resolve();
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
    const modalList = [...document.getElementsByClassName('modal')];
    const blurList  = [...document.getElementsByClassName('modal-blur')];

    registerButton.addEventListener('click', () => {
      const modal    = document.getElementById('register-modal');

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

    for (const modalElem of modalList) {
      modalElem.addEventListener('click', e => {
        if (isModalShowing) {
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

