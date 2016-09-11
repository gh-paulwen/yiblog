package me.paul.yiblog.dao;

import java.io.Serializable;

import me.paul.yiblog.entity.Resource;

public interface IResourceDao {

	void save(Resource resource);

	void delete(Resource resource);

	void update(Resource resource);

	Resource get(Serializable id);

}
