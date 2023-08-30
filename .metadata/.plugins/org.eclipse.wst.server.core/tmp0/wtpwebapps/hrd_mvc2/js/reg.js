/** 
-회원번호 6자리 필수입력
-회원성명 필수입력
-회원전화번호 필수입력 -> 이후**정규표현식 적용도 테스트
-주소 필수입력
-가입일자 오늘날짜가 자동으로 8자리 표시
-고객등급은 A,B,C 중 하나만 허용
-도시코드 2자리 필수
form action ='list.html' 로 합시다.
제출은 hrd 폴더에 변경된 파일만 올리세요.
 */
const patternDate = (vdate,symbol) =>
{
	const year = vdate.getFullYear()
	const month = (vdate.getMonth()+1).toString().padStart(2,0)
	const day = (vdate.getDate()).toString().padStart(2,0)
	
	let result = [year,month,day].join(symbol)

	return result
}

document.forms[0].regDate.value = patternDate(new Date(),'')


function func_reg()
{
	const frm = document.forms[0]
	const custno = frm.custno
	const name = frm.custname
	const phone = frm.phone
	const address = frm.address
	const grade = frm.grade
	const city = frm.city
	let isValid = true
	
	/*let retCustno = /^[0-9]{6}$/
	if(retCustno.test(custno.value)===false)
	{
		alert('회원번호는 숫자 6자리 입니다.')
		custno.focus()
		isValid = false
	}*/
	
	let regTel = /^010-[0-9]{4}-[0-9]{4}$/
	let regCity = /^[0-9]{2}$/
	if(name.value=='')
	{
		alert('이름은 필수 입력입니다.')
		name.focus()
		isValid = false
	} else
	
	if(phone.value=='')
	{
		alert('전화번호는 필수 입력입니다.')
		phone.focus()
		isValid = false
	} else
	
	if(regTel.test(phone.value)===false)
	{
		alert('전화번호 형식이 틀렸습니다.')
		phone.focus()
		isValid = false
	} else
	
	if(address.value=='')
	{
		alert('주소는 필수 입력입니다.')
		address.focus()
		isValid = false
	} else
	if(!(grade.value=='A'||grade.value=='B'||grade.value=='C'))
	{
		alert('등급은 A,B,C만 입력 가능합니다.')
		grade.focus()
		isValid = false
	} else
	if(regCity.test(city.value)===false)
	{
		alert('도시코드는 숫자 2자리 입니다.')
		city.focus()
		isValid = false
	}
	
	
	
	if(isValid) 
	{
        frm.submit()
    }
	 /*else 
	{alert('유효성 통과 실패!!!')}*/
}