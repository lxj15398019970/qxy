package cn.ld.fj.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by xjli on 15-8-21.
 */
@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_COMPANY")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Company extends IdEntity {
    private String detail;
    private String headImage;
    private String url;


    @Transient
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }
}
