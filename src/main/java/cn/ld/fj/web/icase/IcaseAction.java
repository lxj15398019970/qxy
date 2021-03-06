package cn.ld.fj.web.icase;

import cn.ld.fj.entity.Icase;
import cn.ld.fj.service.IcaseManager;
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
@Namespace("/icase")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "icase.action", type = "redirect")})
public class IcaseAction extends SimpleJsonActionSupport<Icase> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Icase> page = new Page<Icase>(10);
    @Autowired
    private IcaseManager icaseManager;

    private File caseImage;

    private String caseImageFileName;

    public File getCaseImage() {
        return caseImage;
    }

    public void setCaseImage(File caseImage) {
        this.caseImage = caseImage;
    }

    public String getCaseImageFileName() {
        return caseImageFileName;
    }

    public void setCaseImageFileName(String caseImageFileName) {
        this.caseImageFileName = caseImageFileName;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = icaseManager.getEntity(id);
        } else {
            entity = new Icase();
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
        page = icaseManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {

        if (caseImage != null) {
            String tineStr = DateUtil.getTimeStamp() + RandomCodeUtil.generateNumCode(6);
            // 保存地址url
            String url = Config.save_url;
            // 上传动作

            String suffix = caseImageFileName.substring(caseImageFileName.lastIndexOf("."));


            String accessUrl = Config.access_url + tineStr + suffix;

            url = url + tineStr + suffix;

            FileUtils.copyFile(caseImage, new File(url));
            entity.setHeadImage(accessUrl);
        }
        icaseManager.save(entity);
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_icase",
                "操作成功"));


    }


    @Override
    public void delete() throws Exception {
        icaseManager.delete(id);


        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_icase",
                "操作成功"));

    }

    public Page<Icase> getPage() {
        return page;
    }

    public void setPage(Page<Icase> page) {
        this.page = page;
    }
}
