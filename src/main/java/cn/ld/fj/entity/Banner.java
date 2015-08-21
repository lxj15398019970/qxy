package cn.ld.fj.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by xjli on 15-8-21.
 */


@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_BANNER")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Banner extends IdEntity {

    private String image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
