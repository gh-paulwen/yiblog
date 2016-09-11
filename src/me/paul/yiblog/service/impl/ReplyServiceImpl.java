package me.paul.yiblog.service.impl;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.dao.IReplyDao;
import me.paul.yiblog.entity.Reply;
import me.paul.yiblog.service.IReplyService;

public class ReplyServiceImpl implements IReplyService {

	private IReplyDao replyDao;

	public void setReplyDao(IReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public void save(Reply reply) {
		replyDao.save(reply);
	}

	@Override
	public void delete(Reply reply) {
		replyDao.delete(reply);
	}

	@Override
	public void update(Reply reply) {
		replyDao.update(reply);
	}

	@Override
	public Reply get(Serializable id) {
		return replyDao.get(id);
	}

	@Override
	public List<Reply> getByComment(Serializable commentId) {
		return replyDao.getByComment(commentId);
	}

}
