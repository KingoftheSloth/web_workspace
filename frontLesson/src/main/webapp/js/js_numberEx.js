/**
 * 
 */

const calculate = () => {
	//데이터 가져올 요소를 변수에 저장하기 
	const op1 = document.getElementById('operand1')
	const op2 = document.getElementById('operand2')
	const op = document.getElementById('operator')
	
	let result; // 계산 결과를 저장할 변수


	switch (op.value) {
		case '+':
			result = Number(op1.value) + Number(op2.value)
			//number() : 문자열을 number 타입으로 변환
			// Number('12') 는 12, Number('abc') 는 변환 못하므로 NaN(Not a Number)  리턴 
			break;
		case '-':
			result = op1.value - op2.value
			break;
		case '*':
			result = op1.value * op2.value
			break;
		
		case '/':
			result = op1.value / op2.value
			break;

		default:
			alert('알 수 없는 연산입니다.')
	}
document.getElementById('result').value = result
}

document.getElementById('executeBtn').addEventListener
('click', calculate)

console.log('result')

 // executeBtn 버튼에 'Click' 이벤트 작성하기 
