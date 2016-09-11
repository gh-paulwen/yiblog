package me.paul.yiblog.action;

import me.paul.yiblog.entity.Power;
import me.paul.yiblog.service.IPowerService;

import com.opensymphony.xwork2.ActionSupport;

public class PowerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1984923609788968528L;
	
	private IPowerService powerService ;
	
	public void setPowerService(IPowerService powerService) {
		this.powerService = powerService;
	}
	
	private Power power;
	
	public Power getPower() {
		return power;
	}
	
	public void setPower(Power power) {
		this.power = power;
	}
	
	public String save(){
		powerService.save(power);
		return SUCCESS;
	}
	
}
