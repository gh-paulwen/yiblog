package me.paul.yiblog.action;

import me.paul.yiblog.entity.Statistic;
import me.paul.yiblog.service.IStatisticService;

import com.opensymphony.xwork2.ActionSupport;

public class StatisticAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7192665440558080779L;
	
	private Statistic statistic;

	public Statistic getStatistic() {
		return statistic;
	}

	public void setStatistic(Statistic statistic) {
		this.statistic = statistic;
	}

	private IStatisticService statisticService;

	public void setStatisticService(IStatisticService statisticService) {
		this.statisticService = statisticService;
	}

	public String save() {
		statisticService.save(statistic);
		return SUCCESS;
	}
	
	public String get(){
		statistic = statisticService.get(statistic.getId());
		System.out.println(String.format("%s,%d",statistic.getWhat(),statistic.getTime()));
		return SUCCESS;
	}
}
