package sino.java.base;

import java.io.Serializable;
import java.util.List;
import sino.java.common.PageView;

public interface BaseFinder<T> {
	
	public T findById(Class<T> entityClass,Serializable id);
	
	public List<T> findAll(Class<T> entityClass,String sql);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object key,int pageNo,int pageSize);
	
	public PageView<T> findByPage(Class<T> entityClass,String sql,Object[] keys,int pageNo,int pageSize);
}
