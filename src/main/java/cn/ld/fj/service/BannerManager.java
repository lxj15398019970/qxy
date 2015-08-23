package cn.ld.fj.service;

import cn.ld.fj.dao.BannerDao;
import cn.ld.fj.entity.Banner;
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
public class BannerManager {

    @Autowired
    private BannerDao bannerDao;


    @Transactional(readOnly = true)
    public Banner getEntity(Long id) {
        return bannerDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Banner> searchList(Page<Banner> page, List<PropertyFilter> filters) {
        return bannerDao.findPage(page, filters);

    }

    public void save(Banner entity) {

        bannerDao.save(entity);
    }

    public void delete(Long id) {
        bannerDao.delete(id);
    }

    public List<Banner> getAllByIdDesc() {
        String hql = "select b from Banner b order by b.id desc";
        Query query = bannerDao.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(5);
        return query.list();
    }
}
