package cn.ld.fj.tools;

import net.esoar.modules.test.utils.JettyUtils;
import org.mortbay.jetty.Server;

/**
 * 使用Jetty运行调试Web应用, 在Console输入回车停止服务.
 *
 * @author fly
 */
public class Start {

    public static final int PORT = 8085;
    public static final String CONTEXT = "/qxy";
    public static final String BASE_URL = "http://localhost:8085/qxy/home-page.action";

    public static void main(String[] args) throws Exception {
        Server server = JettyUtils.buildNormalServer(PORT, CONTEXT);
        server.start();
        System.out.println(BASE_URL);

        System.out.println("Hit Enter in console to stop server");
        if (System.in.read() != 0) {
            server.stop();
            System.out.println("Server stopped");
        }
    }
}
