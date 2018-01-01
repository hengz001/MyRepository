package sino.java.daoimpl.base;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sino.java.dao.base.IDAO;

@Repository("iDAO")
@Transactional
public class IDAOImpl implements IDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(Object obj) {
		getSession().save(obj);
	}

	public void delete(Object obj) {
		getSession().delete(obj);
	}

	public void update(Object obj) {
		getSession().update(obj);
	}

	public void saveOrUpdate(Object obj) {
		getSession().saveOrUpdate(obj);
	}

	public <T> void remove(Class<T> entity, Serializable id) {
		getSession().delete(getSession().load(entity, id));
	}

	public <T> void deleteByLogic(Class<T> entity,Serializable[] ids,String id,String flag) {
		
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<ids.length;i++) {
			sb.append("?").append(",");
		}
		//删除最后一个逗号
		sb.deleteCharAt(sb.length()-1);
		String className = entity.getName();
		//update className o set flag = 0 where o.id in (ids);
		Query query = getSession().createQuery(
				"update " + className + " o set o." + flag + "= ? where o."
						+ id + " in(" + sb.toString() + ")");
		query.setParameter(0, 0);
		for(int i=0;i<ids.length;i++) {
			query.setParameter(i+1,ids[i]);
		}
		query.executeUpdate();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
