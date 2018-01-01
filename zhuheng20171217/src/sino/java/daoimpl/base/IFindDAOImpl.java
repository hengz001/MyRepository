package sino.java.daoimpl.base;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sino.java.dao.base.IFindDAO;
import sino.java.po.common.PageView;

@Repository("iFindDAO")
@Transactional
public class IFindDAOImpl<T> implements IFindDAO<T>{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private  Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	public T findById(Class<T> entityClass, Serializable id) {
		return getSession().find(entityClass, id);
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
//		pv.setTotalNo(totalNo);
//		Query<T> query = getSession().createQuery(sql,entityClass);
//		if(null!=keys && keys.length>0){
//			for (int j = 0; j < keys.length; j++) {
//				query.setParameter(j, keys[j]);
//			}
//		}
//		query.setFirstResult(pageNo).setMaxResults(pageSize);
//		List<T> pageList = query.getResultList();
//		if(null != pageList){
//			pv.setPageList(pageList);
//		}
//		return pv;
		pv.setTotalNo(totalNo);
		Query query = getSession().createQuery(sql);
		if (keys != null && keys.length > 0) {
			for (int i = 0; i < keys.length; i++) {
				query.setParameter(i, keys[i]);
			}
		}
		query.setFirstResult(pageNo).setMaxResults(pageSize);
		List<T> pageList = query.list();
		pv.setPageList(pageList);
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
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
