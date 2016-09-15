package me.paul.yiblog.action;

import java.util.Date;

import me.paul.yiblog.entity.Comment;
import me.paul.yiblog.entity.Passage;
import me.paul.yiblog.entity.User;
import me.paul.yiblog.service.ICommentService;

import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {

	private static final long serialVersionUID = 5816530900340080938L;

	private Comment comment;

	private Passage passage;

	private User fromUser;

	private User toUser;

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

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Passage getPassage() {
		return passage;
	}

	public void setPassage(Passage passage) {
		this.passage = passage;
	}

	private ICommentService commentService;

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public String save() {

		comment.setPassage(passage);
		comment.setCommenttime(new Date());
		comment.setFromUser(fromUser);
		comment.setToUser(toUser);
		comment.setNewComment(1);
		commentService.save(comment);
		return "toPassage";
	}

}
