package me.paul.yiblog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import me.paul.yiblog.entity.Announcement;
import me.paul.yiblog.entity.Statistic;
import me.paul.yiblog.service.IAnnouncementService;
import me.paul.yiblog.service.IStatisticService;

public class LoadSiteInfoFilter implements Filter{

	@Override
	public void destroy() {
		
	}
	
	private IAnnouncementService announcementService;
	
	private IStatisticService statisticService;
	
	public void setAnnouncementService(IAnnouncementService announcementService) {
		this.announcementService = announcementService;
	}
	
	public void setStatisticService(IStatisticService statisticService) {
		this.statisticService = statisticService;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		Announcement buildSite = announcementService.get(2l);
		Announcement lastUpdateTime = announcementService.get(3l);
		Statistic totaltime = statisticService.get(1l);
		request.setAttribute("buildSite", buildSite);
		request.setAttribute("lastUpdate", lastUpdateTime);
		request.setAttribute("totaltime", totaltime);
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
