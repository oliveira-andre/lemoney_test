require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import toastr from 'toastr/toastr';

document.addEventListener("turbolinks:load", function (e) {
  let flashtoastr = document.getElementsByClassName('flashtoastr-item');
  if(!flashtoastr[0]) return;

  let target = document.getElementsByClassName('flashtoastr-item')[0];

    switch (target.dataset.type) {
      case 'notice':
        toastr.info(target.textContent);
        break;
      case 'alert':
        toastr.warning(target.textContent);
        break;
      case 'error':
        toastr.error(target.textContent);
        break;
      case 'success':
        toastr.success(target.textContent);
        break;
      default:
        toastr.info(target.textContent);
    }
});

