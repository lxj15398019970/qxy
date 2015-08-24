package cn.ld.fj.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Created by xjli on 15-8-21.
 */

@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_CASE")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Icase extends IdEntity {
    private String caseName;
    private String caseContent;
    private String headImage;
    private String url;

    @Transient
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCaseName() {
        return caseName;
    }

    public void setCaseName(String caseName) {
        this.caseName = caseName;
    }

    public String getCaseContent() {
        return caseContent;
    }

    public void setCaseContent(String caseContent) {
        this.caseContent = caseContent;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }
}
