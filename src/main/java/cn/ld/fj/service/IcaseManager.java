package cn.ld.fj.service;

import cn.ld.fj.dao.IcaseDao;
import cn.ld.fj.entity.Icase;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class IcaseManager {

    @Autowired
    private IcaseDao icaseDao;


    @Transactional(readOnly = true)
    public Icase getEntity(Long id) {
        return icaseDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Icase> searchList(Page<Icase> page, List<PropertyFilter> filters) {
        return icaseDao.findPage(page, filters);

    }

    public void save(Icase entity) {

        icaseDao.save(entity);
    }

    public void delete(Long id) {
        icaseDao.delete(id);
    }

    public List<Icase> findByIdDesc() {
        String hql = "select b from Icase b order by b.id desc";
        Query query = icaseDao.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(10);
        return query.list();
    }
}
