package sino.java.dao.base;

import java.io.Serializable;

public interface IDAO {
	
	/*
	 * 
	 */
	public void save(Object obj);
	
	/*
	 * 
	 */
	public void delete(Object obj);
	
	/*
	 * 
	 */
	public void update(Object obj);
	
	/*
	 * 
	 */
	public void saveOrUpdate(Object obj);
	
	/*
	 * 
	 */
	public <T> void remove(Class<T> entity,  Serializable id);
	
	public <T> void deleteByLogic(Class<T> entity,Serializable[] ids,String id,String flag);
}
