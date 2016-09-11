package me.paul.yiblog.action;

import java.util.Date;
import java.util.Map;

import me.paul.yiblog.entity.Power;
import me.paul.yiblog.entity.User;
import me.paul.yiblog.service.IUserService;
import me.paul.yiblog.util.CommonUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	
	private static final long serialVersionUID = -9213858011869747588L;

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String save() {
		Power power = new Power();
		power.setId(2);
		user.setPower(power);
		user.setPassword(CommonUtil.generateMD5(user.getPassword()));
		Date date = new Date();
		user.setRegisterDate(date);
		user.setLastLoginDate(date);
		synchronized (UserAction.class) {
			userService.save(user);
		}
		return SUCCESS;
	}

	public String login(){
		User userGet = userService.getByName(user.getName());
		if(userGet != null){
			if(userGet.getPassword().trim().equalsIgnoreCase(CommonUtil.generateMD5(user.getPassword()))){
				Map<String,Object> sessionMap = ActionContext.getContext().getSession();
				sessionMap.put("currentUser", userGet);
				userGet.setLastLoginDate(new Date());
				userService.update(userGet);
				return "index";
			}							
		}
		return INPUT;
	}
	
	public String logout(){
		if(ActionContext.getContext().getSession().containsKey("currentUser")){
			ActionContext.getContext().getSession().remove("currentUser");
		}
		return "index";
	}
}
