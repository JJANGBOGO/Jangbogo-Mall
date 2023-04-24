// 메서드명 : formatPriceWithComma
// 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 3자리마다 콤마를 삽입해준다.
// 매개변수 : 금액에 해당하는 텍스트
let formatPriceWithComma = (price) => {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 메서드명 : formatPriceWithoutComma
// 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 3자리마다 삽입한 콤마를 제거한다.
// 매개변수 : 콤마가 포함된 금액에 해당하는 텍스트
let formatPriceWithoutComma = (price) => {
    return price.toString().replace(",", '');
}

// 메서드명 : formatMpnoWithHyphen
// 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 각 자리에 하이픈을 삽입해준다.
// 매개변수 : 휴대폰번호에 해당하는 텍스트
let formatMpnoWithHyphen = (mpno) => {
    return mpno.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
}

// 메서드명 : formatMpnoWithoutHyphen
// 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 각 자리에 삽입한 하이픈을 제거한다.
// 매개변수 : 하이픈이 포함된 휴대폰번호에 해당하는 텍스트
let formatMpnoWitoutHyphen = (mpno) => {
    return mpno.toString().replace(/-/g, '');
}

