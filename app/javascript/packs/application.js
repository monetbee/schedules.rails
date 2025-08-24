import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('turbolinks:load', () => {
  const allDay = document.getElementById('all_day');
  const start  = document.getElementById('start_at');
  const end    = document.getElementById('end_at');

  if (!allDay || !start || !end) return;

  // 直前の値を退避（All day解除で元に戻す用）
  let prevStart = start.value;
  let prevEnd   = end.value;

  const toDateOnly = (v) => (v ? v.substring(0, 10) : '');

  const toggle = () => {
    if (allDay.checked) {
      // 現在値を退避してから date に変更
      prevStart = start.type === 'datetime-local' ? start.value : prevStart;
      prevEnd   = end.type   === 'datetime-local' ? end.value   : prevEnd;

      start.type = 'date';
      end.type   = 'date';
      if (start.value) start.value = toDateOnly(start.value);
      if (end.value)   end.value   = toDateOnly(end.value);
    } else {
      start.type = 'datetime-local';
      end.type   = 'datetime-local';
      if (prevStart) start.value = prevStart;
      if (prevEnd)   end.value   = prevEnd;
    }
  };

  allDay.addEventListener('change', toggle);
  toggle(); // 初期表示時にも反映
});
