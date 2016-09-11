package me.paul.yiblog.dao.impl;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.dao.IReplyDao;
import me.paul.yiblog.entity.Reply;
import me.paul.yiblog.util.HibernateUtil;

public class ReplyDaoImpl implements IReplyDao {

	private HibernateUtil util;

	public void setUtil(HibernateUtil util) {
		this.util = util;
	}

	@Override
	public void save(Reply reply) {
		util.save(reply);
	}

	@Override
	public void delete(Reply reply) {
		util.delete(reply);
	}

	@Override
	public void update(Reply reply) {
		util.update(reply);
	}

	@Override
	public Reply get(Serializable id) {
		return (Reply) util.get(Reply.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> getByComment(Serializable commentId) {
		String hql = "from Reply r where r.comment = ?";
		return (List<Reply>) util.query(hql, commentId);
	}

}
