package me.paul.yiblog.service;

import java.io.Serializable;

import me.paul.yiblog.entity.Resource;

public interface IResourceService {

	void save(Resource resource);

	void delete(Resource resource);

	void update(Resource resource);

	Resource get(Serializable id);

}
