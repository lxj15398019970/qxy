package cn.ld.fj.web;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.util.DwzUtil;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Results({@Result(name = JsonActionSupport.RELOAD, location = "home-page.action", type = "redirect")})
public class HomePageAction extends SimpleJsonActionSupport<Agent> {

    private static final long serialVersionUID = 8683878162525847072L;

    @Override
    protected void prepareModel() throws Exception {

    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_agent",
                "操作成功"));


    }


    @Override
    public void delete() throws Exception {

    }


}
