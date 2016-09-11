package me.paul.yiblog.action;

import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import me.paul.yiblog.entity.Category;
import me.paul.yiblog.entity.Passage;
import me.paul.yiblog.entity.SubCategory;
import me.paul.yiblog.entity.User;
import me.paul.yiblog.service.ICategoryService;
import me.paul.yiblog.service.IPassageService;
import me.paul.yiblog.service.ISubCategoryService;
import me.paul.yiblog.util.CommonUtil;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PassageAction extends ActionSupport {
	
	private static final long serialVersionUID = 1306752896985884525L;

	private IPassageService passService;
	private ICategoryService cateService;
	private ISubCategoryService subCategoryService;

	public void setSubCategoryService(ISubCategoryService subCategoryService) {
		this.subCategoryService = subCategoryService;
	}

	public void setPassService(IPassageService passService) {
		this.passService = passService;
	}

	public void setCateService(ICategoryService cateService) {
		this.cateService = cateService;
	}

	private Passage passage;
	private Category category;
	private SubCategory subCategory;
	private User author;
	private int page;
	private int passagePerPage;
	private String what;
	private String searchContent;

	public String getWhat() {
		return what;
	}

	public void setWhat(String what) {
		this.what = what;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getPassagePerPage() {
		return passagePerPage;
	}

	public void setPassagePerPage(int passagePerPage) {
		this.passagePerPage = passagePerPage;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public void setPassage(Passage passage) {
		this.passage = passage;
	}

	public Passage getPassage() {
		return passage;
	}

	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	public Category getCategory() {
		return category;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String save() {
		passage.setCategory(category);
		passage.setReadtime(0);
		passage.setAuthor(author);
		passage.setWritetime(new Date());
		passage.setSubCategory(subCategory);
		synchronized (PassageAction.class) {
			category = cateService.get(category.getId());
			subCategory = subCategoryService.get(subCategory.getId());
			category.setPassageCount(category.getPassageCount() + 1);
			subCategory.setPassageCount(subCategory.getPassageCount() + 1);
			cateService.update(category);
			subCategoryService.update(subCategory);
			passService.save(passage);
		}
		return SUCCESS;
	}

	public String get() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		passage = passService.get(passage.getId());
		@SuppressWarnings("unchecked")
		List<Long> hasReadPassages = (List<Long>) session.getAttribute("read");
		if (hasReadPassages == null) {
			hasReadPassages = new LinkedList<Long>();
		}

		if (!hasReadPassages.contains(passage.getId())) {
			synchronized (PassageAction.class) {
				passage.setReadtime(passage.getReadtime() + 1);
				passService.update(passage);
			}
			hasReadPassages.add(passage.getId());
		}

		session.setAttribute("read", hasReadPassages);
		ActionContext.getContext().getContextMap().put("passage", passage);
		return "viewPassage";
	}

	public String page() {
		
		int count = 0;
		
		List<Passage> list = Collections.emptyList();
		
		if(category != null){
			category = cateService.get(category.getId());
			count = category.getPassageCount();
			ActionContext.getContext().getContextMap().put("currentCate", category.getName());
			list = passService.categoryPage(page, passagePerPage, category.getId());
		}
		
		if(subCategory != null){
			subCategory = subCategoryService.get(subCategory.getId());
			count = subCategory.getPassageCount();
			ActionContext.getContext().getContextMap().put("currentCate", subCategory.getName());
			list = passService.subCategoryPage(page, passagePerPage, subCategory.getId());
		}
		
		if(category == null && subCategory == null){
			count = cateService.getTotalPassageCount();
			ActionContext.getContext().getContextMap().put("currentCate", "all");
			list = passService.page(page, passagePerPage);
		}
		
		int pageCount = (int) Math.ceil(count * 1.0 / passagePerPage);
		Map<String, Integer> mapPage = CommonUtil.getPageMap(pageCount, page);
		ActionContext.getContext().getContextMap().put("listPassage", list);
		ActionContext.getContext().getContextMap().put("mapPage", mapPage);
		return "passageList";
	}
}
