package sino.java.daoimpl.base;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sino.java.common.PageView;
import sino.java.dao.IFindDAO;

@Service
public class IFindDAOImpl<T> implements IFindDAO<T>{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}

	public T findById(Class<T> entityClass, Serializable id) {
		return getSession().get(entityClass, id);
	}

	public List<T> findAll(Class<T> entityClass, String sql) {
		return getSession().createQuery(sql, entityClass).getResultList();
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, int pageNo, int pageSize) {
		return findByPage( entityClass,  sql,null, pageNo,  pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object key, int pageNo, int pageSize) {
		return findByPage(entityClass,sql, new Object[]{key}, pageNo, pageSize);
	}

	public PageView<T> findByPage(Class<T> entityClass, String sql, Object[] keys, int pageNo, int pageSize) {
		PageView<T> pv = new PageView<T>();
		int totalNo = getTotal(sql, keys,entityClass);
		pv.setTotalNo(totalNo);
		Query<T> query = getSession().createQuery(sql,entityClass);
		if(null!=keys && keys.length>0){
			for (int j = 0; j < keys.length; j++) {
				query.setParameter(j, keys[j]);
			}
		}
		query.setFirstResult((pageNo-1)*pageSize).setMaxResults(pageSize);
		List<T> pageList = query.getResultList();
		if(null != pageList){
			pv.setPageList(pageList);
		}
		return pv;
	}
	
	private int getTotal(String sql,Object[] keys,Class<T> entityClass){
		int totalNo = 0;
		Query<T> query = getSession().createQuery(sql,entityClass);
		if(null!=keys && keys.length>0){
			for (int j = 0; j < keys.length; j++) {
				query.setParameter(j, keys[j]);
			}
		}
		List<T> list = query.getResultList();
		if(null != list){
			totalNo = list.size();
		}
		return totalNo;
	}
	
}
