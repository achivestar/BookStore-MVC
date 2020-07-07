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
		}else if(command.equals("index")) {
			action = new Index();
		}
		
		
		
		return action;
	}
}
