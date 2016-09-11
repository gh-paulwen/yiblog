package me.paul.yiblog.action;

import java.util.Date;

import me.paul.yiblog.entity.Comment;
import me.paul.yiblog.entity.Reply;
import me.paul.yiblog.entity.User;
import me.paul.yiblog.service.ICommentService;
import me.paul.yiblog.service.IReplyService;

import com.opensymphony.xwork2.ActionSupport;

public class ReplyAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7911788803952912838L;
	
	private IReplyService replyService ;
	
	private ICommentService commentService;
	
	public void setReplyService(IReplyService replyService) {
		this.replyService = replyService;
	}
	
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	
	private Reply reply ;
	
	private Comment comment;
	
	private User fromUser;
	
	private User toUser;
	
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	public Reply getReply() {
		return reply;
	}
	
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
	
	public String save(){
		reply.setFromUser(fromUser);
		reply.setToUser(toUser);
		reply.setNewreply(1);
		reply.setReplytime(new Date());
		synchronized (ReplyAction.class) {
			comment = commentService.get(comment.getId());
			comment.setReplyCount(comment.getReplyCount() + 1);
			commentService.update(comment);
			reply.setComment(comment);
			replyService.save(reply);
		}
		return SUCCESS;
	}

}
