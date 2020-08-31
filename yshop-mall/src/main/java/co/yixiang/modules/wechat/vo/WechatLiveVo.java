package co.yixiang.modules.wechat.vo;

import co.yixiang.modules.wechat.service.dto.YxWechatLiveDto;
import lombok.Data;

import java.util.List;

@Data
public class WechatLiveVo {

    private List<YxWechatLiveDto> content;

    private Long totalElements;
}
