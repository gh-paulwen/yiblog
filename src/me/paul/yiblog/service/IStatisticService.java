package me.paul.yiblog.service;

import java.io.Serializable;

import me.paul.yiblog.entity.Statistic;

public interface IStatisticService {

	void save(Statistic statistic);

	void update(Statistic statistic);

	Statistic get(Serializable id);

}
