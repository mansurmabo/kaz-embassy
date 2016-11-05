$(function () {

    $.fn.datepicker.dates['ru'] = {
        days: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
        daysShort: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        daysMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        months: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", 'Сентябрь', "Октябрь", "Ноябрь", "Декабрь"],
        monthsShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Нояб", "Дек"],
        clear: "Очистить дату",
        titleFormat: "MM yyyy"
    };

    $('.datepicker').datepicker({
        language: 'ru',
        format: "dd/mm/yyyy"
    });
});