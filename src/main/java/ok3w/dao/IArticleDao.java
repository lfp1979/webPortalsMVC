package ok3w.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ok3w.entity.Article;

public interface IArticleDao{

	List<Article> QueryByAttr(String attr, Object value, String paixu);

	Article getMoveArticle();

	List<Article> getPicList();

	int getCount();

	List<Article> listPage(@Param("index")int index,@Param("count") int count);

	void save(Article art);

	void update(Article art);
	void del(int articleId);
	Article get(int articleId);
	List<Article> getByClassId(int classId);
	List<Article> getClassArticles(@Param("id")int id,@Param("count") int count);

	List<Article> getClassArticlesOrderByHits(@Param("id")int id,@Param("count") int count);

	List<Article> getClassArticlesOrderAddTime(@Param("id") int id,@Param("count") int count);

}