package me.paul.yiblog.service;

import java.io.Serializable;

import me.paul.yiblog.entity.User;

public interface IUserService {
	void save(User user);

	void delete(User user);

	void update(User user);

	User get(Serializable id);
	
	User getByName(String name);
	
	User getByEmail(String email);
}
