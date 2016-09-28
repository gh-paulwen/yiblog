package me.paul.yiblog.dao.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IStatisticDao;
import me.paul.yiblog.entity.Statistic;
import me.paul.yiblog.util.HibernateUtil;

public class StatisticDaoImpl implements IStatisticDao{
	
	private HibernateUtil util ;
	
	public void setUtil(HibernateUtil util) {
		this.util = util;
	}

	@Override
	public void save(Statistic statistic) {
		util.save(statistic);
	}

	@Override
	public void update(Statistic statistic) {
		util.update(statistic);
	}

	@Override
	public Statistic get(Serializable id) {
		return (Statistic) util.get(Statistic.class,id);
	}

}
