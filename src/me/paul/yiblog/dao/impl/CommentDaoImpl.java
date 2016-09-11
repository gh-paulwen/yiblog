package me.paul.yiblog.dao.impl;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.dao.ICommentDao;
import me.paul.yiblog.entity.Comment;
import me.paul.yiblog.util.HibernateUtil;

public class CommentDaoImpl implements ICommentDao{

	private HibernateUtil util ;
	
	public void setUtil(HibernateUtil util) {
		this.util = util;
	}
	
	@Override
	public void save(Comment comment) {
		util.save(comment);
	}

	@Override
	public void delete(Comment comment) {
		util.delete(comment);
	}

	@Override
	public void update(Comment comment) {
		util.update(comment);
	}

	@Override
	public Comment get(Serializable id) {
		return (Comment) util.get(Comment.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getByPassage(Serializable passageid) {
		String hql = "from Comment c where c.passage.id = ?";		
		return (List<Comment>) util.query(hql, passageid);
	}

}
