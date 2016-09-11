package me.paul.yiblog.dao;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.entity.Passage;

public interface IPassageDao {
	void save(Passage passage);

	void delete(Passage passage);

	void update(Passage passage);

	Passage get(Serializable id);

	List<Passage> page(int n, int passagePerPage);

	List<Passage> categoryPage(int n, int passagePerPage, long categoryId);

	List<Passage> subCategoryPage(int n, int passagePerPage, long subCategoryId);
	
	List<Passage> mostRead(int count);
	
	List<Passage> latest(int count);	
}
