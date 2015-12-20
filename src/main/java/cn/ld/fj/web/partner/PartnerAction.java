package cn.ld.fj.web.partner;

import cn.ld.fj.entity.Partner;
import cn.ld.fj.service.PartnerManager;
import cn.ld.fj.util.Config;
import cn.ld.fj.util.DateUtil;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.util.RandomCodeUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/partner")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "partner.action", type = "redirect")})
public class PartnerAction extends SimpleJsonActionSupport<Partner> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Partner> page = new Page<Partner>(10);
    @Autowired
    private PartnerManager partnerManager;

    private File partnerImage;

    private String partnerImageFileName;

    public File getPartnerImage() {
        return partnerImage;
    }

    public void setPartnerImage(File partnerImage) {
        this.partnerImage = partnerImage;
    }

    public String getPartnerImageFileName() {
        return partnerImageFileName;
    }

    public void setPartnerImageFileName(String partnerImageFileName) {
        this.partnerImageFileName = partnerImageFileName;
    }

    public Page<Partner> getPage() {
        return page;
    }

    public void setPage(Page<Partner> page) {
        this.page = page;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = partnerManager.getEntity(id);
        } else {
            entity = new Partner();
        }
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        if (CollectionUtils.isNotEmpty(filters)) {
            System.out.println(filters.get(0).getPropertyName());
        }
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }
        page = partnerManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {

        if (partnerImage != null) {
            String tineStr = DateUtil.getTimeStamp() + RandomCodeUtil.generateNumCode(6);
            // 保存地址url
            String url = Config.save_url;
            // 上传动作

            String suffix = partnerImageFileName.substring(partnerImageFileName.lastIndexOf("."));


            String accessUrl = Config.access_url + tineStr + suffix;

            url = url + tineStr + suffix;

            FileUtils.copyFile(partnerImage, new File(url));
            entity.setHeadImage(accessUrl);
        }
        partnerManager.save(entity);
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_partner",
                "操作成功"));


    }


    @Override
    public void delete() throws Exception {
        partnerManager.delete(id);


        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_partner",
                "操作成功"));

    }


}
