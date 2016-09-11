package me.paul.yiblog.dao;

import java.io.Serializable;
import java.util.List;

import me.paul.yiblog.entity.Reply;

public interface IReplyDao {
	
	void save(Reply reply);
	
	void delete(Reply reply);
	
	void update(Reply reply);
	
	Reply get(Serializable id);
	
	List<Reply> getByComment(Serializable commentId);

}
