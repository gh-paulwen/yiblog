package me.paul.yiblog.dao;

import java.io.Serializable;

import me.paul.yiblog.entity.User;

public interface IUserDao {

	void save(User user);

	void delete(User user);

	void update(User user);

	User get(Serializable id);
	
	User getByName(String name);
	
	User getByEmail(String email);

}
