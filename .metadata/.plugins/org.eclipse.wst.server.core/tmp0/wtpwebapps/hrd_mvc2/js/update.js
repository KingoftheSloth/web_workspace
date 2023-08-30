function func_valid()
{
	const frm = document.forms[0]
	const phone = frm.phone
	const address = frm.address
	const grade = frm.grade
	const city = frm.city
	let isValid = true
	
	let regTel = /^010-[0-9]{4}-[0-9]{4}$/
	let regCity = /^[0-9]{2}$/
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