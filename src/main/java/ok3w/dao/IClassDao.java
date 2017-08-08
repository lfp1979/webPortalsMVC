package ok3w.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ok3w.entity.Clazz;

public interface IClassDao{

	Clazz find(@Param("parentId") int parentId,@Param("orderId") int orderId);
	List<Clazz> getByParentId(int parentId);
	List<Clazz> list();

	Clazz get(int id);

	void save(Clazz clazz);
	void update(Clazz clazz);
	void delete(Clazz clazz);

}