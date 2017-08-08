package ok3w.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import ok3w.entity.Clazz;
import ok3w.service.Service;
@Scope("prototype")
@Controller
@RequestMapping("/admin")
public class ClassAdmin{
	@Autowired
	private Service service;
	private List<Clazz> list;
	private Map<String,String> path;
	private String msg;
	private Clazz clazz;
	private int id;
	@RequestMapping("/delClass.mvc")
	public String del(@Validated Clazz clazz,BindingResult br,Map<String,Object> model)
	{
		service.delClass(clazz);
		return list(clazz.getParent().getId(),model);
	}
	@RequestMapping("/saveOrUpdateClass.mvc")
	public String saveOrUpdate(@Validated Clazz clazz,BindingResult br,Map<String,Object> model)
	{
	   
	   service.ClassSaveOrUpdate(clazz);
		return list(clazz.getParent().getId(),model);
		
	}
	@RequestMapping("/listClass.mvc")
	public String list(int id,Map<String,Object> model)
	{
		List list=service.listClassChild(id);
		Map path=service.getClassPathInAdmin(service.getClass(id));
		model.put("list", list);
		model.put("path",path);
		model.put("clazz", new Clazz());
		return "admin/classManage";
		
	}
	public List<Clazz> getList() {
		return list;
	}
	public void setList(List<Clazz> list) {
		this.list = list;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Map<String,String> getPath() {
		return path;
	}
	public void setPath(Map<String,String> path) {
		this.path = path;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
