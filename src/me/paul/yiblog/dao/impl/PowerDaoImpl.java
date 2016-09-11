package me.paul.yiblog.dao.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IPowerDao;
import me.paul.yiblog.entity.Power;
import me.paul.yiblog.util.HibernateUtil;

public class PowerDaoImpl implements IPowerDao {

	private HibernateUtil util;

	public void setUtil(HibernateUtil util) {
		this.util = util;
	}

	@Override
	public void save(Power power) {
		util.save(power);
	}

	@Override
	public void delete(Power power) {
		util.delete(power);
	}

	@Override
	public void update(Power power) {
		util.update(power);
	}

	@Override
	public Power get(Serializable id) {
		return (Power) util.get(Power.class, id);
	}

}
