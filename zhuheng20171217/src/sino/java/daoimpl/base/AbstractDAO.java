package sino.java.daoimpl.base;

import java.util.Collection;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import sino.java.dao.IDAO;
import sino.java.dao.base.BaseDAO;

@Service
public abstract class AbstractDAO extends IDAOImpl implements BaseDAO{
	
	@Resource(name="IDAOImpl")
	private IDAO iDAO;

	/*
	 * 
	 */
	public void save(Object obj){
		iDAO.save(obj);
	}
	
	/*
	 * 
	 */
	public void delete(Object obj){
		iDAO.delete(obj);
	}
	
	/*
	 * 
	 */
	public void update(Object obj){
		iDAO.update(obj);
	}
	
	/*
	 * 
	 */
	public void saveOrUpdate(Object obj){
		iDAO.saveOrUpdate(obj);
	}
	
	/*
	 * 
	 */
	public void save(Object[] objs){
		for (Object obj : objs) {
			iDAO.save(obj);
		}
	}
	
	/*
	 * 
	 */
	public void delete(Object[] objs){
		for (Object obj : objs) {
			iDAO.delete(obj);
		}
	}
	
	/*
	 * 
	 */
	public void update(Object[] objs){
		for (Object obj : objs) {
			iDAO.update(obj);
		}
	}
	
	/*
	 * 
	 */
	public void saveOrUpdate(Object[] objs){
		for (Object obj : objs) {
			iDAO.saveOrUpdate(obj);
		}
	}
	
	/*
	 * 
	 */
	public <T> void save(Collection<T> objs){
		for (Object obj : objs) {
			iDAO.save(obj);
		}
	}
	
	/*
	 * 
	 */
	public <T> void delete(Collection<T> objs){
		for (Object obj : objs) {
			iDAO.delete(obj);
		}
	}
	
	/*
	 * 
	 */
	public <T> void update(Collection<T> objs){
		for (Object obj : objs) {
			iDAO.update(obj);
		}
	}
	
	/*
	 * 
	 */
	public <T> void saveOrUpdate(Collection<T> objs){
		for (Object obj : objs) {
			iDAO.saveOrUpdate(obj);
		}
	}
}
