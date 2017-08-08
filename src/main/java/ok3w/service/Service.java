package ok3w.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import ok3w.dao.*;
import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.entity.UrlLink;
import ok3w.util.Util;

@org.springframework.stereotype.Service
@Transactional
public class Service {
	@Autowired
	private IArticleDao articleDao;
	@Autowired
	private IUrlLinkDao urlLinkDao;
	@Autowired
	private IClassDao classDao;
	public List<Article> QueryArticlesByAttr(String attr,Object value, String paixu)
	  {
			return articleDao.QueryByAttr(attr, value,paixu);
	  }
	
	public List<UrlLink> getUrlLinks()
	{
		return urlLinkDao.list();
	}
	public Article getMoveArticle()
	{
		return articleDao.getMoveArticle();
	}
	public List<Article> getPicList()
	{
		return articleDao.getPicList();
	}
		/**
		 * @param pageNum 页码
		 * @param numsPerPage 每页记录数
		 * @return  分页导航条
		 */
	public String articlePagination(int pageNum,int numsPerPage)
	{
		int recordCount=articleDao.getCount();
		int pageCount=recordCount/numsPerPage+1;
		String pageUrl="listArticle.mvc";
		return Util.getPagination(pageNum, pageCount, recordCount, pageUrl);
	}
	/**
	 * @param pageNum 页码
	 * @param numsPerPage 每页记录数
	 * @return  
	 */
	public List<Article> listArticlesByPage(int pageNum,int numsPerPage)
	{
		return articleDao.listPage((pageNum-1)*numsPerPage, numsPerPage);
	}
	/**
	 * 
	 * @return 
	 * the first String is sortName,second is url 
	 */
	public Map<String,String> getArticlePath(Article art)
	{
		
		 Map<String,String> path=new LinkedHashMap();
		 Map<Integer, String> sortNames = getSortNames();
		 String pathStr[]=art.getSortPath().split(",");
		 String name,url;
		 for(String id:pathStr)
		 {
			 if(id.equals("0"))
			 {
				 name="网站首页";
				 url="/webPortals/index.mvc";
			 }
			 else
			 {
				 name=sortNames.get(Integer.parseInt(id));
				 url="getClassArticles.mvc?classId="+id;
			 }
			 path.put(name, url);
		 }
		return path;
	}
	public Map<String,String> getClassPath(Clazz clazz)
	{
		 Map<String,String> path=new LinkedHashMap();
		 Map<Integer, String> sortNames = getSortNames();
		 String pathStr[]=clazz.getSortPath().split(",");
		 String name,url;
		 for(String id:pathStr)
		 {
			 if(id.equals("0"))
			 {
				 name="网站首页";
				 url="/webPortals/index.mvc";
			 }
			 else
			 {
				 name=sortNames.get(Integer.parseInt(id));
				 url="getClassArticles.mvc?classId="+id;
			 }
			 path.put(name, url);
		 }
		return path;
	}
	
	public Map<String,String> getClassPathInAdmin(Clazz clazz)
	{
		 Map<String,String> path=new LinkedHashMap();
		 Map<Integer, String> sortNames = getSortNames();
		 String pathStr[]=clazz.getSortPath().split(",");
		 String name,url;
		 for(String id:pathStr)
		 {
			 if(id.equals("0"))
			 {
				 name="顶级类别";
			 }
			 else
			 {
				 name=sortNames.get(Integer.parseInt(id));
			 }
			 url="listClass.mvc?id="+id;
			 path.put(name, url);
		 }
		return path;
	}
	
	public  Map<Integer,String> getSortNames()
	{
		 Map<Integer,String> map=new HashMap();
		 map.put(0, "最近更新");
		 List<Clazz> list=classDao.list();
		 for(Clazz cla:list)
			 map.put(cla.getId(), cla.getSortName());
		return map;
		
	}
	@Transactional(propagation=Propagation.NEVER)
	public  List<Clazz> buildListSorts()
	{
		List<Clazz> in = this.listSorts();
		List<Clazz> out=new ArrayList<>();
		for(Clazz c:in)
		 {
			if(c.getParent()!=null)
			if(c.getParent().getId()==0)
				buildListSorts(c.getId(),in,out);
		 }
		return out;
	}
	@Transactional(propagation=Propagation.NEVER)
	private  void buildListSorts(int classId,List<Clazz> in,List<Clazz>out)
	{
		
		for(Clazz c:in)
		 {
			if (c.getId() == classId) {
				out.add(c);
				// change sortName to "|--sortName"
				int layer = c.getSortPath().split(",").length - 2;
				StringBuffer sf = new StringBuffer();
				sf.append('|');
				for (int i = 0; i < layer; i++) {
					sf.append("--");
				}
				sf.append(c.getSortName());
				c.setSortName(sf.toString());
			}
		}
		for(Clazz c:in)
		 {
			if(c.getParent()!=null)
			if(c.getParent().getId()==classId)
				buildListSorts(c.getId(),in,out);
		 }
	}
	
	/**
	 * must called before buildListSorts(),
	 */
	@Transactional(propagation=Propagation.NEVER)
	private List<Clazz> listSorts()
	{
		return classDao.list();
	}
	
	public void articleSaveOrUpdate(Article art)
	{
		if(art.getId()==0)
			articleDao.save(art);
		else
			articleDao.update(art);
		
	}
	public void addArticleHits(Article art)
	{
		art.setHits(art.getHits()+1);
		articleDao.update(art);
	}
	public void setArticleProperry(String cmd,int articleId)
	{
		Article art=articleDao.get(articleId);
		switch (cmd)
		{
			case "commend":
				art.setIsCommend(true);
				break;
			case "uncommend":
				art.setIsCommend(false);
				break;
			case "pic":
				art.setIsPic(true);
				break;
			case "unpic":
				art.setIsPic(false);
				break;
			case "del":
				articleDao.del(articleId);
			
				return;
			case "top":
				art.setIsTop(true);
				break;
			case "untop":
				art.setIsTop(false);
				break;
			case "pass":
				art.setIsPass(true);
				break;
			case "unpass":
				art.setIsPass(false);
				break;
		}
		articleDao.update(art);
	}
	
	/**
	 * 
	 * @param id is the article's id
	 * @return an article with all property including 
	 * the property of content
	 */
	
	public Article getArticleFull(int id)
	{
		return articleDao.get(id);
		
	}
	/**
	 * 
	 * @param id is the article's id
	 * @return a simple article without 
	 * the property of content
	 */
	public Article getArticleSimple(int id)
	{
		return null;
		
	}
	/**
	 * 
	 * @param id the parent id
	 * @return Clazz of child
	 */
	public List<Clazz> listClassChild(int id) 
	{
		
			Clazz parent=classDao.get(id);
			parent.getChild().size();
			return parent.getChild();
		
	}
	//获得所有此分类下（包括子分类）的文章列表
	public List<Article> getClassArticles(int id)
	{
		return articleDao.getClassArticles(id,0);
	}
	public List<Article> getClassArticles(int id,int count)
	{
		return articleDao.getClassArticles(id,count);
	}
	public List<Article> getClassArticlesOrderByHits(int id,int count)
	{
		return articleDao.getClassArticlesOrderByHits(id, count);
	}
	public List<Article> getClassArticlesOrderAddTime(int id,int count)
	{
		return articleDao.getClassArticlesOrderAddTime(id, count);
	}
	public Clazz getClassWithChild(int id)
	{
	    Clazz clazz= classDao.get(id);
	    clazz.getChild().size();
	    return clazz;
	}
	public Clazz getClass(int id)
	{
		return classDao.get(id);
	}
	public Clazz getClass(int parentId,int orderId)
	{
		return classDao.find(parentId,orderId);
	}
	public void delClass(Clazz clazz)
	{
		 classDao.delete(clazz);
	}
	public void ClassSaveOrUpdate(Clazz clazz)
	{
		if(clazz.getId()==0)
		{
			classDao.save(clazz);
			Clazz parent=getClass(clazz.getParent().getId());
			clazz.setSortPath(parent.getSortPath()+clazz.getId()+",");
			classDao.update(clazz);
		}
			
		else
		{
			classDao.update(clazz);
			Clazz parent=getClass(clazz.getParent().getId());
			clazz.setSortPath(parent.getSortPath()+clazz.getId()+",");
			classDao.update(clazz);
		}
		
	}
}
