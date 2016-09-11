package me.paul.yiblog.service.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IPowerDao;
import me.paul.yiblog.entity.Power;
import me.paul.yiblog.service.IPowerService;

public class PowerServiceImpl implements IPowerService{

	
	private IPowerDao powerDao ;
	
	public void setPowerDao(IPowerDao powerDao) {
		this.powerDao = powerDao;
	}
	
	@Override
	public void save(Power power) {
		powerDao.save(power);
	}

	@Override
	public void delete(Power power) {
		powerDao.delete(power);
	}

	@Override
	public void update(Power power) {
		powerDao.update(power);
	}

	@Override
	public Power get(Serializable id) {
		return powerDao.get(id);
	}

}
