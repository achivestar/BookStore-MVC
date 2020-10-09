function submits(){

	if(QnaRegist.question.value==""){
		alert("제목을 입력해 주세요.");
		QnaRegist.question.focus();
		return false;
	}
	if(QnaRegist.answer.value==""){
		alert("질문 내용을 입력하세요");
		QnaRegist.answer.focus();
		return false;
	}
	
	
    var formData = $("#QnaRegist").serialize();
    
	   $.ajax({
			type : "get",
			url : "./Controller.do?command=qnaRegistAction",
		   data : formData,
			success : function(data){
				if(data==1){
					alert("문의사항이 등록되었습니다.\n 빠른 시간내에 답변을 드리도록 하겠습니다.");
					location.href="./Controller.do?command=qnaList";
				}else{
					alert("문의사항 등록에 실패했습니다.\n 다시 등록해 주세요");
					location.href="./Controller.do?command=qnaList";
				}
			   
			},beforeSend : function(){
				$(".spinner-border").removeClass("displayLoding");
			},complete:function(){
				$(".spinner-border").addClass("displayLoding");	
			}
		})

}

function qnaList(){
	location.href="./AdminController.do?command=qnaList";
}

