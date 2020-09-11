package com.pe.bluering.action;

public class ActionFactory {

	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("board_list")) {
			action = new BoardListAction();
		}else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		}else if(command.equals("board_write")) {
			action = new BoardWriteProAction();
		}else if(command.equals("contract")){
			action = new ContractAction();
		}else if(command.equals("join_form")) {
			action = new JoinFormAction();
		}else if(command.equals("memberJoinAction")){
			action = new MemberJoinAction();
		}else if(command.equals("login_form")) {
			action = new LoginFormAction();
		}else if(command.equals("login_action")) {
			action = new LoginProAction();
		}else if(command.equals("logout")) {
			action = new LogoutAction();
		}else if(command.equals("idCheck")) {
			action = new IdCheck();
		}else if(command.equals("memberModify")) {
			action = new MemberModify();
		}else if(command.equals("memberModifyForm")) {
			action = new memberModifyForm();
		}else if(command.equals("memberModifyPro")) {
			action = new memberModifyProAction();
		}else if(command.equals("mypage")) {
			action = new MypageAction();
		}else if(command.equals("cart")) {
			action = new CartAction();
		}else if(command.equals("newbook")) {
			action = new NewBook();
		}else if(command.equals("bookLoading")){
			action = new BookLoading();
		}else if(command.equals("bookCateLoading")){
			action = new bookCateLoading();
		}else if(command.equals("bookSearchLoading")){
			action = new bookSearchLoading();
		}else if(command.equals("bookSearch")){
			action = new bookSearch();
		}else if(command.equals("bestbook")){
			action = new BestBook(); 
		}else if(command.equals("bookBestLoading")){
			action = new BookBestLoading();
		}else if(command.equals("bookBestCateLoading")){
			action = new BookBestCateLoading();
		}else if(command.equals("bookDetail")){
			action = new BookDetail();
		}else if(command.equals("addCart")){
			action = new BookAddCart();
		}else if(command.equals("order")){
			action = new BookOrder();
		}else if(command.equals("cartUpdate")){
			action = new CartUpdate();
		}else if(command.equals("addCartModify")){
			action = new addCartModify();
		}else if(command.equals("cartDelete")){
			action = new CartDelete();
		}else if(command.equals("addOrder")){
			action = new AddOrder();
		}else if(command.equals("orderList")){
			action = new OrderList();
		}else if(command.equals("addOrders")){
			action = new AddOrders();
		}else if(command.equals("bookOrderLoading")){
			action = new bookOrderLoading();
		}else if(command.equals("orderSuccess")){
			action = new OrderSucess();
		}else if(command.equals("index")) {
			action = new Index();
		}
		
		
		
		
		return action;
	}
}
