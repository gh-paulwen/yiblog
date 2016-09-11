package me.paul.yiblog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import me.paul.yiblog.entity.Statistic;
import me.paul.yiblog.service.IStatisticService;

public class AggregateFilter implements Filter {

	private IStatisticService statService;

	public void setStatService(IStatisticService statService) {
		this.statService = statService;
	}

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		Object comed = session.getAttribute("comed");
		if (comed == null || comed.toString().equals("false")) {
			synchronized (this) {
				Statistic stat = statService.get(1l);
				if (stat != null) {
					stat.setTime(stat.getTime() + 1);
					statService.update(stat);
					session.setAttribute("comed", "true");
					req.setAttribute("totalComed", stat.getTime());
				}
			}
		}
		chain.doFilter(req, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
