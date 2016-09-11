package me.paul.yiblog.action;

import me.paul.yiblog.entity.Resource;
import me.paul.yiblog.service.IResourceService;

import com.opensymphony.xwork2.ActionSupport;

public class ResourceAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4029431537418252098L;
	
	private Resource resource;

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	private IResourceService resourceService;

	public void setResourceService(IResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public String save() {
		resourceService.save(resource);
		return SUCCESS;
	}

}
