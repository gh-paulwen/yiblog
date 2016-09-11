package me.paul.yiblog.service;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.entity.Comment;

public interface ICommentService {

	void save(Comment comment);

	void delete(Comment comment);

	void update(Comment comment);

	Comment get(Serializable id);
	
	List<Comment> getByPassage(Serializable id);

}
