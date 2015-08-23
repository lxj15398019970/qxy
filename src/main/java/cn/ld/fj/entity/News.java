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
@Table(name = "ES_NEWS")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class News extends IdEntity {
    private String title;
    private String time;
    private String content;
    private String headImage;
    private int newsType;  //0行业，1公司

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public int getNewsType() {
        return newsType;
    }

    public void setNewsType(int newsType) {
        this.newsType = newsType;
    }
}
