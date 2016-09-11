package me.paul.yiblog.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import me.paul.yiblog.entity.Comment;
import me.paul.yiblog.entity.Passage;
import me.paul.yiblog.service.ICommentService;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoadCommentInterceptor implements Interceptor{

	private static final long serialVersionUID = -5379743802608929975L;

	@Override
	public void destroy() {
		
	}

	@Override
	public void init() {
		
	}
	
	private ICommentService commentService;
	
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Passage passage = (Passage) request.getAttribute("passage");
		if(passage == null) return invocation.invoke();
		long passageid = passage.getId();
		List<Comment> listComment = commentService.getByPassage(passageid);
		for(Comment c: listComment){
			System.out.println(c.getFromUser().getName());
		}
		request.setAttribute("listComment", listComment);
		request.setAttribute("listCommentSize", listComment.size());
		return invocation.invoke();
	}

}
