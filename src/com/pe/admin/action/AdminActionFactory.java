package com.pe.admin.action;


public class AdminActionFactory {

	public AdminAction getAction(String command) {
		AdminAction action = null;
		
		if(command.equals("productWriteForm")) {
			action = new ProductWriteAction();
		}else if(command.equals("index")) {
			action = new index();
		}else if(command.equals("orderForm")) {
			action = new orderFormAction();
		}else if(command.equals("customer")) {
			action = new Customer();
		}else if(command.equals("BookRegistAction")) {
			action = new BookRegistAction();
		}else if(command.equals("BookList")) {
			action = new BookListAction();
		}
		
		
		return action;
	}
}
