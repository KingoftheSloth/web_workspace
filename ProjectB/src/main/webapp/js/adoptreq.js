	let allow = true
  	
  	var yesRadio = document.getElementById("havejob");
    var noRadio = document.getElementById("uhavejob");
	
    var familya = document.getElementById("alone");
    var familyp = document.getElementById("parent");
	var familym = document.getElementById("marry");
	var familyc = document.getElementById("child");

    var hidden1 = document.getElementById("hd1");
    var hidden2 = document.getElementById("hd2");
    var hidden3 = document.getElementById("hd3");
    var hidden4 = document.getElementById("hd4");

    // 라디오 버튼의 변경 이벤트 리스너 등록
    yesRadio.addEventListener("change", function() {
        // "예" 값을 선택했을 때
        if (yesRadio.checked) {
        	hidden1.style.display = "none"; // 두 번째 <div> 숨김
        }
    });

    noRadio.addEventListener("change", function() {
        // "아니오" 값을 선택했을 때
        if (noRadio.checked) {
        	hidden1.style.display = "block"; // 두 번째 <div> 보이게 함
        }
    });
    
    familya.addEventListener("change", function() {
        if (familya.checked) {
        	familyp.checked = false;
        	familym.checked = false;
        	familyc.checked = false;
        	hidden2.style.display = "none";
    		hidden3.style.display = "none";
    		hidden4.style.display = "none";
        }
    });
    
    familyp.addEventListener("change", function() {
        if (familyp.checked) {
        	familya.checked = false;
        }
        
    	if (familyp.checked || familym.checked || familyc.checked){
    		hidden2.style.display = "block";
    		hidden3.style.display = "block";
    	}
    	else {
    		hidden2.style.display = "none";
    		hidden3.style.display = "none";
    	}
    });
    
    familym.addEventListener("change", function() {
        if (familym.checked) {
        	familya.checked = false;
        }
        
    	if (familyp.checked || familym.checked || familyc.checked){
    		hidden2.style.display = "block";
    		hidden3.style.display = "block";
    	}
    	else {
    		hidden2.style.display = "none";
    		hidden3.style.display = "none";
    	}
    });
    
    familyc.addEventListener("change", function() {
        if (familyc.checked) {
        	familya.checked = false;
        }
        
    	if (familyp.checked || familym.checked || familyc.checked){
    		hidden2.style.display = "block";
    		hidden3.style.display = "block";
    		if (familyc.checked) {
    			hidden4.style.display = "block";
    		}
    		else {
    			hidden4.style.display = "none";
    		}
    	}
    	
    	else {
    		hidden2.style.display = "none";
    		hidden3.style.display = "none";
    		hidden4.style.display = "none";
    	}
    });
    
    function isNo(value) {
		if (value == 'no'){
			allow = false
		}
	}
    
    function req_test(){
		var f = document.forms[0]
		
		let fail = 0
		
		var q1 = f.age.value
		var q2 = f.job.value
		var q2_1 = f.hvjob.value
		var q3 = f.money.value
		var q4 = f.allergy.value
		var q5 = f.family.value
		var q5_1_1 = f.agree.value
		var q5_1_2 = f.fallergy.value
		var q5_2_1 = f.cage.value
		var q6 = f.leave.value
		var q7 = f.anihome.value
		var q8 = f.house.value
		
		var f1 = f.form1.value
		var f2 = f.form2.value
		var f3 = f.form3.value
		
		if(q1 < 18){
			allow = false
			console.log(q1)
		}
		if (q2 == 'no'){
			fail += 10
			console.log(q2)
		}
		
		isNo(q2_1)
		
		if(q3 == 0) {
			allow = false
			console.log(q3)
		}
		else if (q3 == 100){
			fail += 10
			console.log(q3)
		}
		
		if(q4 == 'yes') {
			allow = false
			console.log(q4)
		}
		
		if(q5_1_1 == 'half'){
			fail += 10
			console.log(q5_1_1)
		}
		if(q5_1_2 == 'yes'){
			allow = false
			console.log(q5_1_2)
		}
		
		if(familyc.checked){
			if(q5_2_1 < 5) {
				allow = false
				console.log(q5_2_1)
			}
		}
		
		if(q6 == 4) {
			fail += 10
			console.log(q6)
		} else if (q6 == 8) {
			allow = false
			console.log(q6)
		}
		
		if(q7 == 'no'){
			allow = false
			console.log(q7)
		}
		
		if(q8 == 4) {
			allow = false
			console.log(q8)
		}
		
		isNo(f1)
		isNo(f2)
		isNo(f3)
		
		
		
		if (allow == false || fail > 30) {
			alert('입양 심사 탈락!')
		}
		else {
			alert('입양 심사 통과!')
			location.href = '../selectDate.jsp';
		}
		
		
		
	}