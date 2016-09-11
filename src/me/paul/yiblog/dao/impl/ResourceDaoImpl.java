package me.paul.yiblog.dao.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IResourceDao;
import me.paul.yiblog.entity.Resource;
import me.paul.yiblog.util.HibernateUtil;

public class ResourceDaoImpl implements IResourceDao {

	private HibernateUtil util;

	public void setUtil(HibernateUtil util) {
		this.util = util;
	}

	@Override
	public void save(Resource resource) {
		util.save(resource);
	}

	@Override
	public void delete(Resource resource) {
		util.delete(resource);
	}

	@Override
	public void update(Resource resource) {
		util.update(resource);
	}

	@Override
	public Resource get(Serializable id) {
		return (Resource) util.get(Resource.class, id);
	}

}
