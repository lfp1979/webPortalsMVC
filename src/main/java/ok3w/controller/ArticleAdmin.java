package ok3w.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.service.Service;

@Controller
@Scope("prototype")
@RequestMapping("/admin")
public class ArticleAdmin{
	@Autowired
	private Service service;
	private List<Article> articles;
	private List<Clazz> sorts;
	private int[] ids;
	private int id;
	private int pageNum;
	private String pagination,cmd,uploadResponse;
	private Article article;
	private int numsPerPage=10;
	public String uploadFiles()
	{
		return cmd;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat,false));
	} 
	@RequestMapping(value="/saveOrUpdateArticle.mvc",method=RequestMethod.POST)
	public String saveOrUpdate(@Validated Article article,BindingResult br,Map<String,Object> model)
	{
		if(br.hasErrors())
		{
			model.put("sorts", service.buildListSorts());
			model.put("article", article);
			return "admin/articleEdit";
		}
		service.articleSaveOrUpdate(article);
		return "redirect:/admin/editArticle.mvc?id="+article.getId();
	}
	@RequestMapping(value="/updateArticle.mvc",method=RequestMethod.POST)
	public String update(@Validated ArticleAdmin data,BindingResult br,Map<String,Object> model)
	{
		for(int id:data.getIds())
		{
		 service.setArticleProperry(data.getCmd(), id);
		}
		ids=new int[data.getIds().length];
		System.arraycopy(data.getIds(), 0, ids, 0, data.getIds().length);
		//return "redirect:/admin/listArticle.mvc?pageNum="+data.getPageNum();
		return list(data.getPageNum(),model);
	}
	@RequestMapping("/addArticle.mvc")
	public String add(Map<String,Object> model)
	{
		article=new Article();
		article.setAddTime(new Date());
		model.put("sorts", service.buildListSorts());
		model.put("article", article);
		return "admin/articleEdit";
	}
	@RequestMapping("/editArticle.mvc")
	public String edit(int id,Map<String,Object> model)
	{
		model.put("article", service.getArticleFull(id));
		model.put("sorts", service.buildListSorts());
		return "admin/articleEdit";
	}
	@RequestMapping("/listArticle.mvc")
	public String list(int pageNum,Map<String,Object> model)
	{
		ArticleAdmin data=new ArticleAdmin();
		data.setIds(ids);
		data.setArticles(service.listArticlesByPage(pageNum, numsPerPage));
		data.setPagination(service.articlePagination(pageNum, numsPerPage));
		data.setPageNum(pageNum);
		model.put("data", data);
		return "admin/articleList";
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getPagination() {
		return pagination;
	}
	public void setPagination(String pagination) {
		this.pagination = pagination;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public List<Clazz> getSorts() {
		return sorts;
	}
	public void setSorts(List<Clazz> sorts) {
		this.sorts = sorts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCmd() {
		return cmd;
	}
	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	
	
}
