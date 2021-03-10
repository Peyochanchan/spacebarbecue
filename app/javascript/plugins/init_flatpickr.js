import flatpickr from 'flatpickr';

flatpickr("#flatpickr", {
  altFormat: "j F Y",
  dateFormat: "d-m-Y",
  minDate: "today"
  });

flatpickr("#flatpickr-2", {
  altFormat: "j F Y",
  dateFormat: "d-m-Y"
  });

export { flatpickr };
