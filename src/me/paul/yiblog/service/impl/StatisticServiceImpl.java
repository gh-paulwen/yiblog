package me.paul.yiblog.service.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IStatisticDao;
import me.paul.yiblog.entity.Statistic;
import me.paul.yiblog.service.IStatisticService;

public class StatisticServiceImpl implements IStatisticService {

	private IStatisticDao statisticDao ;
	
	public void setStatisticDao(IStatisticDao statisticDao) {
		this.statisticDao = statisticDao;
	}

	@Override
	public void save(Statistic statistic) {
		statisticDao.save(statistic);
	}

	@Override
	public void update(Statistic statistic) {
		statisticDao.update(statistic);
	}

	@Override
	public Statistic get(Serializable id) {
		return statisticDao.get(id);
	}

}
