package sino.java.dao.base;

import java.io.Serializable;
import java.util.List;

import sino.java.po.common.PageView;

public interface IFindDAO<T> extends BaseDAO{
	
	public T findById(Class<T> entityClass,Serializable id);
	
	public List<T> findAll(Class<T> entityClass,String sql);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object key,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object[] keys,int pageNo,int pageSize);
}
