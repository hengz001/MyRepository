package sino.java.dao.base;

import java.util.Collection;

public interface BaseDAO {
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
	public void save(Object[] objs);
	
	/*
	 * 
	 */
	public void delete(Object[] objs);
	
	/*
	 * 
	 */
	public void update(Object[] objs);
	
	/*
	 * 
	 */
	public void saveOrUpdate(Object[] objs);
	
	/*
	 * 
	 */
	public <T> void save(Collection<T> objs);
	
	/*
	 * 
	 */
	public <T> void delete(Collection<T> objs);
	
	/*
	 * 
	 */
	public <T> void update(Collection<T> objs);
	
	/*
	 * 
	 */
	public <T> void saveOrUpdate(Collection<T> objs);
}
