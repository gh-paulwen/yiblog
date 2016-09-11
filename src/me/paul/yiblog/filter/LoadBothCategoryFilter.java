package me.paul.yiblog.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import me.paul.yiblog.entity.Category;
import me.paul.yiblog.entity.SubCategory;
import me.paul.yiblog.service.ICategoryService;
import me.paul.yiblog.service.ISubCategoryService;

public class LoadBothCategoryFilter implements Filter{
	
	
	private ICategoryService categoryService;
	
	private ISubCategoryService subCategoryService;
	
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	public void setSubCategoryService(ISubCategoryService subCategoryService) {
		this.subCategoryService = subCategoryService;
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		List<Category> listCategory = categoryService.getAll();
		Map<Category,List<SubCategory>> map = new HashMap<Category,List<SubCategory>>();
		for(Category category:listCategory){
			map.put(category,subCategoryService.getByCategory(category.getId()));
		}
		request.setAttribute("mapCategory", map);
		request.setAttribute("categoryCount", listCategory.size());
		chain.doFilter(request,response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
