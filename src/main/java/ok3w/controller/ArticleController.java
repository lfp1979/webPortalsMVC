package ok3w.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.entity.UrlLink;
import ok3w.service.Service;

@Controller
@Scope("prototype")
public class ArticleController{
	@Autowired
	private Service service;
	private int articleId;
	private int classId;
	private int orderId;
	private Article article;
	private Article moveArticle;
	private Clazz clazz;
	private Clazz clazz0;
	private List<Article> top15;
	private List<Article> new15;
	private List<Article> articleList;
	private List<Article> picList;
	private List<UrlLink> urlList;
	private Map<String,String> path;
	@RequestMapping("/hello.mvc")
    public @ResponseBody String test() {
        return "hello, world! This com from spring!";
        
    }
	@RequestMapping("/getClassArticles.mvc")
	public String getClassArticles(int classId,Map<String,Object> model)
	{
		Clazz clazz=service.getClassWithChild(classId);
		model.put("clazz", clazz);
		model.put("path", service.getClassPath(clazz));
		model.put("articleList", service.getClassArticles(classId));
		model.put("top15", service.getClassArticlesOrderByHits(classId, 15));
		return "listArticles";
		
	}
	@RequestMapping("/listByOrderId.mvc")
	public String listByOrderId(int orderId,Map<String,Object> model)
	{
		Clazz clazz=service.getClass(0,orderId);
	    model.put("clazz", clazz);
	    model.put("articleList",service.getClassArticles(clazz.getId(),8));
		return "articleList";
		
	}
	@RequestMapping("/showTop.mvc")
	public String showTop(Map<String,Object> model)
	{
		model.put("moveArticle", service.getMoveArticle());
		model.put("clazz0", service.getClassWithChild(0));
		return "top";
	}
	@RequestMapping("/index.mvc")
	public String index(Map<String,Object> model)
	{
	
		model.put("picList", service.getPicList());
		model.put("articleList", service.getClassArticles(0,18));
		model.put("clazz", service.getClassWithChild(0));
		model.put("clazz0", service.getClassWithChild(0));
		model.put("urlList", service.getUrlLinks());
		return "index";
	}
	@RequestMapping("articleShow.mvc")
	public String show(int articleId,Map<String,Object> model)
	{
	    Article	article=service.getArticleFull(articleId);
	    model.put("article", article);
	    model.put("path", service.getArticlePath(article));
	    model.put("new15",service.getClassArticlesOrderAddTime(article.getClazz().getId(), 15));
		service.addArticleHits(article);
		return "articleShow";
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Map<String,String> getPath() {
		return path;
	}
	public void setPath(Map<String,String> path) {
		this.path = path;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	public List<Article> getPicList() {
		return picList;
	}
	public void setPicList(List<Article> picList) {
		this.picList = picList;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public Article getMoveArticle() {
		return moveArticle;
	}
	public void setMoveArticle(Article moveArticle) {
		this.moveArticle = moveArticle;
	}
	public List<UrlLink> getUrlList() {
		return urlList;
	}
	public void setUrlList(List<UrlLink> urlList) {
		this.urlList = urlList;
	}
	public List<Article> getTop15() {
		return top15;
	}
	public void setTop15(List<Article> top15) {
		this.top15 = top15;
	}
	public List<Article> getNew15() {
		return new15;
	}
	public void setNew15(List<Article> new15) {
		this.new15 = new15;
	}
	public Clazz getClazz0() {
		return clazz0;
	}
	public void setClazz0(Clazz clazz0) {
		this.clazz0 = clazz0;
	}
	
	
}
