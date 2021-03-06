//
// post modal
//

{
  'use strict';

  const waitLoad = () => {
    return new Promise(resolve => {
      window.addEventListener('DOMContentLoaded', resolve);
    });
  };

  const loadFetchPolyfill = () => {
    return new Promise(resolve => {
      if (window.fetch) resolve();
      else {
        const script = document.createElement('script');
        document.head.appendChild(script);
        script.src = 'https://cdnjs.cloudflare.com/ajax/libs/fetch/3.0.0/fetch.min.js';
        script.onload = () => resolve();
      }
    });
  };

  const bodyParser = (html) => {
    const parsed = html
      .split(/\n/g)
      .map(v => v.replace(/^ +| +$/g, ''))
      .filter(v => v !== '')
      .join('\n')
      .split(/<!--|-->/g)
      .filter((v, i) => i % 2 === 0)
      .filter(v => v !== '\n')
      .join('')
      .split(/<\/?(body|head)>/g)
      .map(v => v.replace(/^\n+|\n+$/g, ''))
      .filter(v => v !== '');
    return  parsed[5];
  };

  // 処理ここから
  (async() => {

    // DOM構築までウェイト
    await waitLoad();
    // modal読み込むときに使う関数が使えなかったときに
    // Polyfillを読み込む
    await loadFetchPolyfill();

   const modal = document.getElementById('modal');
   const modalBack = document.getElementById('modal-back');

  
    // ぼかしを入れる要素
    const header = document.querySelector('body > header');
    const hr = document.querySelector('body > hr');
    const container = document.querySelector('body > div.container');

    // ぼかしを入れる・外す
    const blur = (mode) => {
      const b = mode ? 'blur(3px)' : 'blur(0px)';
      header.style.filter = b;
      hr.style.filter = b;
      container.style.filter = b;
    };

    // 別モーダルへ移動
    const modalSwitch = (ID) => {
      //0,1,2
      for (i = 0; i <= 1; i++) {
        const elem = document.getElementById(`modal-${i}`);
        if (i === ID) {
          elem.style.display = 'block';
        }
        else {
          elem.style.display = 'none';
        }
      }
    };

    // モーダルを開く
    const selectWindow = document.getElementById('music-jacket-select');
    const selectPanel = document.getElementById('music-panel');
    for (const elem of [selectWindow, selectPanel]) {
      elem.addEventListener('click', () => {
        modalSwitch(0);
        blur(true);
        modalBack.style.display = 'block';
      });
    }

    // モーダル0(トレンド)に移動
    for (const elem of document.getElementsByClassName('modal-trend')) {
      elem.addEventListener('click', () => {
        modalSwitch(0);
      });
    }

    // モーダル1(検索前)に移動
    for (const elem of document.getElementsByClassName('modal-search')) {
      elem.addEventListener('click', () => {
        modalSwitch(1);
      });
    }

    // モーダル2(検索後)に移動
    // form内inputタグのsubmit時に実行される
    window.search = () => {
      // ここでは別モーダルへ移動するが
      // TODO: ここで検索結果を受け取る
      modalSwitch(2);
      return false;
    };

    // モーダルを閉じる (キャンセル)
    modal.addEventListener('click', e => {
      e.stopPropagation();
      e.preventDefault();
    });
    for (const elem of [...document.getElementsByClassName('modal-cancel'), modalBack]) {
      elem.addEventListener('click', () => {
        modalBack.style.display = 'none';
        blur(false);
      });
    }

    // モーダルを閉じる (保存)
    for (const elem of document.getElementsByClassName('modal-save')) {
      elem.addEventListener('click', (e) => {
        modalBack.style.display = 'none';
        blur(false);
      });
    }

  })();
}
