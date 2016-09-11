package me.paul.yiblog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class AggregateFilterProxy implements Filter {
	
	private AggregateFilter filter ;

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		filter.doFilter(request, response, chain);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig.getServletContext());
		filter = ac.getBean(AggregateFilter.class,"aggregateFilter");
	}
	

}
