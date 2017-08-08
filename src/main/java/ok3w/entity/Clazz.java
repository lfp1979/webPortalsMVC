package ok3w.entity;

import java.io.Serializable;

import java.util.List;
import java.util.Set;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Range;


/**
 * The persistent class for the ok3w_class database table.
 * 
 */

public class Clazz implements Serializable {
	private static final long serialVersionUID = 1L;
    private int id;
	private boolean isOpen;
	@Min(value = 0)
	private int orderID;
	private Clazz parent;

	private String sortPath;
	private String sortName;
	private List<Clazz> child;
	private Set<Article> articles;

	public Clazz() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Clazz> getChild() {
		return child;
	}

	public void setChild(List<Clazz> child) {
		this.child = child;
	}

	
	public boolean getIsOpen() {
		return this.isOpen;
	}

	public void setIsOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}

	public int getOrderID() {
		return this.orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	

	public Clazz getParent() {
		return parent;
	}

	public void setParent(Clazz parent) {
		this.parent = parent;
	}

	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	public String getSortPath() {
		return this.sortPath;
	}

	public void setSortPath(String sortPath) {
		this.sortPath = sortPath;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public Set<Article> getOk3wArticles() {
		return this.articles;
	}

	public void setOk3wArticles(Set<Article> articles) {
		this.articles = articles;
	}

	public Article addOk3wArticle(Article article) {
		getOk3wArticles().add(article);
		article.setOk3wClass(this);

		return article;
	}

	public Article removeOk3wArticle(Article article) {
		getOk3wArticles().remove(article);
		article.setOk3wClass(null);

		return article;
	}

}