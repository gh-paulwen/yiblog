package me.paul.yiblog.service.impl;

import java.io.Serializable;

import me.paul.yiblog.dao.IResourceDao;
import me.paul.yiblog.entity.Resource;
import me.paul.yiblog.service.IResourceService;

public class ResourceServiceImpl implements IResourceService {

	private IResourceDao resourceDao;

	public void setResourceDao(IResourceDao resourceDao) {
		this.resourceDao = resourceDao;
	}

	@Override
	public void save(Resource resource) {
		resourceDao.save(resource);
	}

	@Override
	public void delete(Resource resource) {
		resourceDao.delete(resource);
	}

	@Override
	public void update(Resource resource) {
		resourceDao.update(resource);
	}

	@Override
	public Resource get(Serializable id) {
		return resourceDao.get(id);
	}

}
