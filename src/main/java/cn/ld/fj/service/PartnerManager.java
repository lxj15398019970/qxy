package cn.ld.fj.service;

import cn.ld.fj.dao.PartnerDao;
import cn.ld.fj.entity.Partner;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
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
public class PartnerManager {

    @Autowired
    private PartnerDao partnerDao;


    @Transactional(readOnly = true)
    public Partner getEntity(Long id) {
        return partnerDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Partner> searchList(Page<Partner> page, List<PropertyFilter> filters) {
        return partnerDao.findPage(page, filters);

    }

    public void save(Partner entity) {

        partnerDao.save(entity);
    }

    public List<Partner> findAll() {
        return partnerDao.getAll();
    }

    public void delete(Long id) {
        partnerDao.delete(id);
    }
}
