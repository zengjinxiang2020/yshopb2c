
package co.yixiang.test;

import co.yixiang.modules.wechat.service.dto.WxMaLiveInfo;
import co.yixiang.modules.wechat.service.WxMaLiveService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BaseTest {
    @Autowired
    private WxMaLiveService wxMaLiveService;
    public void test(){
        WxMaLiveInfo.RoomInfo roomInfo = new WxMaLiveInfo.RoomInfo();
        roomInfo.setName("测试直播间");
    }

}
