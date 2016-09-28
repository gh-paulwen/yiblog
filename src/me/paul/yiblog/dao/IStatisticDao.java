package me.paul.yiblog.dao;

import java.io.Serializable;

import me.paul.yiblog.entity.Statistic;

public interface IStatisticDao {

	void save(Statistic statistic);

	void update(Statistic statistic);

	Statistic get(Serializable id);

}
