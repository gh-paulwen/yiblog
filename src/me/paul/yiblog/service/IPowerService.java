package me.paul.yiblog.service;

import java.io.Serializable;

import me.paul.yiblog.entity.Power;

public interface IPowerService {
	
	void save(Power power);
	void delete(Power power);
	void update(Power power);
	Power get(Serializable id);

}
