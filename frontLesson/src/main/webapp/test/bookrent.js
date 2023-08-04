/**
 * 
 */

	const bor = document.forms[0].bor
  	const returndate = document.forms[0].return
  	const id = document.forms[0].idx
  	const code = document.forms[0].code


let today = new Date()
console.log(today)
bor.value = dateFormat(today,'-')


today.setDate(today.getDate()+Number(14))
console.log(today)

returndate.value = dateFormat(today,'-')
console.log(bor)

bor.addEventListener('input', calculateEnd)

  function calculateEnd() {
            const checked = bor.value;
            const tempDate = new Date(checked)
            tempDate.setDate(tempDate.getDate() + 14);
            returndate.value = dateFormat(tempDate, '-');
        }
 
 function dateFormat(xdate,symbol){
		  const years = xdate.getFullYear();
  const month = (xdate.getMonth() + 1).toString().padStart(2, '0');
  const dates = xdate.getDate().toString().padStart(2, '0');
  const result = [years, month, dates].join(symbol);
  return result;
 }
 

function showAlert() {
  alert(`${id.value}회원님 대여도서 [${code.value}]의 반납기한 날짜는 ${returndate.value}입니다.`);
}
 