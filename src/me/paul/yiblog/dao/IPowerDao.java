package me.paul.yiblog.dao;

import java.io.Serializable;

import me.paul.yiblog.entity.Power;

public interface IPowerDao {
	
	void save(Power power);
	void delete(Power power);
	void update(Power power);
	Power get(Serializable id);

}
