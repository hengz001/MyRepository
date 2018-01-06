package sino.java.dao.base;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import sino.java.common.PageView;

public interface IFindDAO<T> {
	
	public T findById(Class<T> entityClass,Serializable id);
	
	public List<T> findAll(Class<T> entityClass,String sql);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object key,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object[] keys,int pageNo,int pageSize);

	public T findByKeys(Class<T> entityClass,String xql, Object[] keys);
	
	public List<T> findAllKeys(Class<T> entityClass,String xql, Object[] keys);

	public List<T> findAllByCollection(Class<T> entryClass,String xql,Collection cn);
}
