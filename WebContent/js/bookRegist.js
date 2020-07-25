
function checkForm(){
	    var fileNm = $("#bookImage").val();
	
		if(bookRegist.bookName.value==""){
			alert("도서의 이름을 입력하세요");
			bookRegist.bookName.focus();
			return false;
		}
		if(bookRegist.author.value==""){
			alert("저자의 이름을 입력하세요");
			bookRegist.author.focus();
			return false;
		}
		if(bookRegist.publishing.value==""){
			alert("출판사를 입력하세요");
			bookRegist.publishing.focus();
			return false;
		}
		if(bookRegist.publishDay.value==""){
			alert("출판일자를 입력하세요");
			bookRegist.publishDay.focus();
			return false;
		}
		if(bookRegist.cost.value==""){
			alert("원가를 입력하세요");
			bookRegist.cost.value="";
			bookRegist.cost.focus();
			return false;
		}
		
		if(bookRegist.rate.value==""){
			alert("할인율 입력하세요");
			bookRegist.rate.value="";
			bookRegist.rate.focus();
			return false;
		}
		if(isNaN(bookRegist.rate.value)){
			alert("숫자만 허용합니다.");
			bookRegist.rate.value="";
			bookRegist.rate.focus();
			return false;
		}
		if(bookRegist.sellingPrice.value==""){
			alert("판매가를 입력하세요");
			bookRegist.sellingPrice.focus();
			return false;
		}

		if(bookRegist.pageNum.value==""){
			alert("책의 페이지 수를 입력하세요");
			bookRegist.pageNum.focus();
			return false;
		}
		if(isNaN(bookRegist.pageNum.value)){
			alert("숫자만 허용합니다.");
			bookRegist.pageNum.value="";
			bookRegist.pageNum.focus();
			return false;
		}
		if(bookRegist.weight.value==""){
			alert("책의 무게를 입력하세요");
			bookRegist.weight.focus();
			return false;
		}
		if(isNaN(bookRegist.weight.value)){
			alert("숫자만 허용합니다.");
			bookRegist.weight.value="";
			bookRegist.weight.focus();
			return false;
		}

		if(bookRegist.category1.value=='none'){
			alert("대분류를 선택하세요");
			bookRegist.category1.focus();
			return false;
		}
		if(bookRegist.category2.value=='none'){
			alert("소분류를 선택하세요");
			bookRegist.category2.focus();
			return false;
		}
		if(bookRegist.comment.value==""){
			alert("책의 소개를 입력하세요");
			bookRegist.comment.focus();
			return false;
		}
		if (fileNm != "") {
			 
		    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
		 
		    if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext=="jpeg")) {
		        alert("이미지파일만 업로드 가능합니다.");
		        return false;
		    }
		 
		}
		
		return true;
}


function categoryChange(e) {
	var option1 = ["네트워크/해킹/보안", "모바일 프로그래밍", "컴퓨터공학", "웹사이트","프로그래밍언어","OS/데이터베이스","게임","컴퓨터입문/활용"];
	var option2 = ["한국소설", "일본소설", "영미소설", "고전문학","시/희곡","장르소설","비평/창작/이론"];
	var option3 = ["어린이문학", "초등학습", "학습만화/코믹스", "어린이교양", "교과서수록도서"];
	var option4 = ["한국에세이", "외국에세이", "명상/치유", "감성/가족", "연애/사랑","포토에세이","휴먼에세이"];
	var option5 = ["종교일반", "천주교", "불교", "기독교(개신교)", "세계종교","역학/사주"];
	var option6 = ["-소분류-"];
	var target = document.getElementById("category2");

	if(e.value == "IT모바일") var smallOption = option1;
	else if(e.value == "소설/시/희곡") var smallOption = option2;
	else if(e.value == "어린이") var smallOption = option3;
	else if(e.value == "에세이") var smallOption = option4;
	else if(e.value == "종교") var smallOption = option5;
	else if(e.value == "none") var smallOption = option6;

	target.options.length = 0;

	for (x in smallOption) {
		var opt = document.createElement("option");
		opt.value = smallOption[x];
		opt.innerHTML = smallOption[x];
		target.appendChild(opt);
	}	
}

function numberFormat(inputNumber) {
	 bookRegist.cost.value =  inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
}

function rateCalc(rate){

	var price =  parseInt( bookRegist.cost.value.replace(/,/g,""));
	 var sellPrice = bookRegist.sellingPrice.value = (price - (price * rate)/100);
	 var sell = sellPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 bookRegist.sellingPrice.value =  sell;
	//parseInt(bookRegist.sellingPrice.value);
}
