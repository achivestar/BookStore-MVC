function checkForm(){
	  
		if(FaqRegist.question.value==""){
			alert("질문을 입력해 주세요.");
			FaqRegist.question.focus();
			return false;
		}
		if(FaqRegist.answer.value==""){
			alert("답변을 입력하세요");
			FaqRegist.answer.focus();
			return false;
		}
		
		return true;
}

function faqList(){
	location.href="./AdminController.do?command=FaqList";
}

function delFaq(delBtn){
	var data = delBtn.name;
	var num =data;
	var query = {
			num : num,
	};
	
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqDelete",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}
function editOrderFaq(editBtn){
	var data = editBtn.name;
	var i = data.split(",");
	var j = i[1];
	var num =i[0];
	alert(num);
	var faqCategory = $("#faqCategoryOrder"+j).val();
	var question = $("#questionOrder"+j).val();
	var answer = $("#answerOrder"+j).val();
	alert(faqCategory+","+question+","+answer+","+num);
	var query = {
			num : num,
			faqCategory : faqCategory,
			question : question,
			answer : answer
	};
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqUpdate",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}

function delDeliveryFaq(delBtn){
	var data = delBtn.name;
	var num = data;

	var query = {
			num : num
	};
	
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqDelete",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
				 deliveryOrder();
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}
function editDeliveryFaq(editBtn){
	var data = editBtn.name;
	var i = data.split(",");
	var j = i[1];
	var num =data[0];
	var faqCategory = $("#faqCategoryDelivery"+j).val();
	var question = $("#questionDelivery"+j).val();
	var answer = $("#answerDelivery"+j).val();
	alert(faqCategory+","+question+","+answer+","+num);
	var query = {
			num : num,
			faqCategory : faqCategory,
			question : question,
			answer : answer
	};
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqUpdate",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}

function delMemberFaq(delBtn){
	var data = delBtn.name;
	var cat = data.split(",");
	var num =cat[0];
	var category = cat[1];

	var query = {
			num : num,
			category : category
	};
	
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqDelete",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}

function editMemberFaq(editBtn){
	var data = editBtn.name;
	var i = data.split(",");
	var j = i[1];
	var num =i[0];
	alert(num);
	var faqCategory = $("#faqCategoryMember"+j).val();
	var question = $("#questionMember"+j).val();
	var answer = $("#answerMember"+j).val();
	alert(faqCategory+","+question+","+answer+","+num);
	var query = {
			num : num,
			faqCategory : faqCategory,
			question : question,
			answer : answer
	};
	$.ajax({
		type : "POST",
		url : "./AdminController.do?command=FaqUpdate",
	   data : query,
		success : function(data){
			if(data==1){
				 location.href="./AdminController.do?command=FaqList";
			}else{
				location.href="./AdminController.do?command=FaqForm";
			}
		   
		},beforeSend : function(){
			$(".spinner-border").removeClass("displayLoding");
		},complete:function(){
			$(".spinner-border").addClass("displayLoding");	
		}
	})
}

