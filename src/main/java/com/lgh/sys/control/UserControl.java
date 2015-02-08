package com.lgh.sys.control;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.lgh.sys.entity.User;
import com.lgh.sys.service.UserService;

@Scope("prototype")
@Controller
@Namespace("/user")
public class UserControl implements com.opensymphony.xwork2.Action {

	@Autowired
	private UserService userService;

	private User user;
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

	@Action(value = "reg", results = {
			@Result(name = "success", location = "regSuccess.jsp", type = "redirect"),
			@Result(name = "error", location = "regFail.jsp", type = "redirect") })
	public String reg() throws Exception {
		try {
			userService.save(user);
		} catch (Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	@Action(value = "login", results = {
			@Result(name = "admin", location = "loginAdmin.jsp", type = "redirect"),
			@Result(name = "model", location = "loginModel.jsp", type = "redirect"),
			@Result(name = "error", location = "loginFail.jsp", type = "redirect"),
			@Result(name = "grapher", location = "loginGrapher.jsp", type = "redirect") })
	public String login() throws Exception {
		String username = user.getName();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(userService.existUser(user)){//根据用户名和密码和角色组合判断用户是否存在
			session.setAttribute("username",username);
		} 
		return ERROR;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}