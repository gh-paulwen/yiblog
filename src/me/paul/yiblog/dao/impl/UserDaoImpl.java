package me.paul.yiblog.dao.impl;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.dao.IUserDao;
import me.paul.yiblog.entity.User;
import me.paul.yiblog.util.HibernateUtil;

public class UserDaoImpl implements IUserDao {

	private HibernateUtil util;

	public void setUtil(HibernateUtil util) {
		this.util = util;
	}

	@Override
	public void save(User user) {
		util.save(user);
	}

	@Override
	public void update(User user) {
		util.update(user);
	}

	@Override
	public User get(Serializable id) {
		return (User) util.get(User.class, id);
	}

	@Override
	public User getByName(String name) {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) util.query("from User user where user.name = ?", name);
		if(listUser.size() > 0)
			return listUser.get(0);
		return null;
	}

	@Override
	public User getByEmail(String email) {
		String hql = "from User as u where u.email=?";
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) util.query(hql, email);
		if(listUser.size() > 0)
			return listUser.get(0);
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers(int page, int userPerPage) {
		String hql = "from User";
		return (List<User>) util.limitQuery(hql, (page - 1) * userPerPage, userPerPage);
	}

	@Override
	public int getUserCount() {
		String hql = "select count(user) from User as user";
		return util.getCount(hql);
	}

}
