$(document).ready(function(){
	
	$(".custom-file-input").on("change", function() {
		  var fileName = $(this).val().split("\\").pop();
		  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});


})
function idCheck(){
	var id = $("#userID").val().trim();
	//alert(id);
	$.ajax({
			url : "./Controller.do?command=idCheck",
			type : "GET",
			data : {"id":id},
			success : function(res){
				//alert(res);
				//console.log(res);
				if(res==1){
				//	console.log("이미 존재하는 아이디 입니다.");
				  	alert("이미 존재하는 아이디 입니다.");
					 joinForm.userID.value="";
					 joinForm.userID.focus();
				}else{
					return false;
				}
			}
	});
	return false;

}


function checkForm(){
	var  message  = document.getElementById("message");
	var regExp = /[a-zA-Z0-9]{5,20}/;
	var fileNm = $("#customFile").val();
	var str = joinForm.userID.value;

    // 체크 하기위해 test 메소드 사용 ( 숫자,영문이 포함되어 있으면 true 반환 )
  //  alert(message);
    
	if(joinForm.userID.value==""){
		$("#userID").attr("class","form-control is-invalid");
		joinForm.userID.focus();
		return false;
		
	}else{
		$("#userID").attr("class","form-control is-valid");
	}
	
    if (!regExp.test(str) ) {
		$("#userID").attr("class","form-control is-invalid");
		  joinForm.userID.value="";
		  joinForm.userID.focus();
		  return false;
	
   }else{
	   $("#userID").attr("class","form-control is-valid");
   }
	   
	   
    if(joinForm.userPassword.value==""){
	 	$("#userPassword").attr("class","form-control is-invalid");
		joinForm.userPassword.focus();
		return false;
	
	}else{
		$("#userPassword").attr("class","form-control is-valid");
	}
		
		
	if(joinForm.userPassword2.value==""){
		$("#userPassword2").attr("class","form-control is-invalid");	
		joinForm.userPassword2.focus();
		return false;
	
	}else{
		$("#userPassword2").attr("class","form-control is-valid");
	}
		
		
	if(joinForm.userPassword.value!=joinForm.userPassword2.value){
		$("#userPassword").attr("class","form-control is-invalid");	
		$("#userPassword2").attr("class","form-control is-invalid");	
		joinForm.userPassword.value="";
		joinForm.userPassword2.value="";
		joinForm.userPassword.focus();
		return false;
	}else {
		$("#userPassword2").attr("class","form-control is-valid");
	}
		
		
	if(joinForm.userName.value==""){
		$("#userName").attr("class","form-control is-invalid");	
		joinForm.userName.focus();
		return false;
	}else {
		$("#userName").attr("class","form-control is-valid");	
	}
		
		
	if(joinForm.addr1.value=="" ){
		$("#addr1").attr("class","form-control is-invalid");		
		 return false;
	
	}else{
		$("#addr1").attr("class","form-control is-valid");		
	}
		

	 if(joinForm.phone1.value=="" ){
		 $("#phone1").attr("class","form-control is-invalid");
		 joinForm.phone1.value="";
			joinForm.phone1.focus();
		 return false;
	}else{
		 $("#phone1").attr("class","form-control is-valid");		
	}
	 
	 if(joinForm.phone2.value==""  ){
		 $("#phone2").attr("class","form-control is-invalid");
		 joinForm.phone2.value="";
			joinForm.phone2.focus();
		 return false;
	}else{
		 $("#phone2").attr("class","form-control is-valid");		
	}
	 
	 if(joinForm.phone3.value==""  ){
		 $("#phone3").attr("class","form-control is-invalid");
		 joinForm.phone3.value="";
		joinForm.phone3.focus();
		 return false;
	}else{
		 $("#phone3").attr("class","form-control is-valid");		
	}
		
		
	if(joinForm.phone1.value.length <3){
		 $("#phone1").attr("class","form-control is-invalid");
		joinForm.phone1.value="";
		joinForm.phone1.focus();
		return false;
	
	}else{
		 $("#phone1").attr("class","form-control is-valid");
	}
		
		
   if(joinForm.phone2.value.length <3){
	   $("#phone2").attr("class","form-control is-invalid");
		joinForm.phone2.value="";
		joinForm.phone2.focus();
		return false;
	
	}else {
		 $("#phone2").attr("class","form-control is-valid");
	}
		
		
	if(joinForm.phone3.value.length <4){
		$("#phone3").attr("class","form-control is-invalid");
		joinForm.phone3.value="";
		joinForm.phone3.focus();
		return false;
	
	}else{
		$("#phone3").attr("class","form-control is-valid");
	}
		
		
	if(isNaN(joinForm.phone1.value)==true){
		$("#phone1").attr("class","form-control is-invalid");
		joinForm.phone1.value="";
		joinForm.phone1.focus();
		return false;
	
	}else{
		$("#phone1").attr("class","form-control is-valid");
	}
		
		
	if(isNaN(joinForm.phone2.value)==true){
		$("#phone2").attr("class","form-control is-invalid");
		joinForm.phone2.value="";
		joinForm.phone2.focus();
		return false;
		
	}else {
		$("#phone2").attr("class","form-control is-valid");
	}

		
	if(isNaN(joinForm.phone3.value)==true){
		$("#phone3").attr("class","form-control is-invalid");
		joinForm.phone3.value="";
		joinForm.phone3.focus();
		return false;
	
	}else {
		$("#phone3").attr("class","form-control is-valid");
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

/*function setTimes(){
	 $("#message").fadeIn();
	 setTimeout(function(){
		 $("#message").fadeOut();
	 },3000);
}*/
// 회원가입 동의 약관
function go_next(){
	if(document.getElementById("agree").checked==true){
		document.getElementById("join").submit();
		return false;

	}else{
		alert("약관에 동의하셔야만 합니다.");
	}
}


//우편번호
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=zipNum]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=addr1]').val(data.address);
			$('[name=addr2]').val(data.buildingName);
		}
	}).open();
}

function checkLogin(){
	if(loginForm.userID.value==""){
		alert("아이디를 입력해 주세요");
		loginForm.userID.focus();
		return false;
	}else if(loginForm.userPassword.value==""){
		alert("비밀번호를 입력해 주세요.");
		loginForm.userPassword.focus();
		return false;
	}else{
		return true;
	}
}
