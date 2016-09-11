package me.paul.yiblog.action;

import com.opensymphony.xwork2.ActionSupport;

public class UploadImageAction extends ActionSupport{

	private static final long serialVersionUID = 530731674819868775L;
	
	
	@Override
	public String execute() throws Exception {
		System.out.println("upload");
		return SUCCESS;
	}

}
