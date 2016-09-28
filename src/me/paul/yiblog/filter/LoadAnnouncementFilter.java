package me.paul.yiblog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import me.paul.yiblog.entity.Announcement;
import me.paul.yiblog.service.IAnnouncementService;

public class LoadAnnouncementFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	private IAnnouncementService announcementService ;
	
	public void setAnnouncementService(IAnnouncementService announcementService) {
		this.announcementService = announcementService;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		Announcement announcement = announcementService.getLatest();
		request.setAttribute("announcement", announcement);
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
