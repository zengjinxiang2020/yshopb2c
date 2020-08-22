package co.yixiang.modules.wechat.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.util.json.WxMaGsonBuilder;
import co.yixiang.modules.wechat.service.WxMaLiveService;
import co.yixiang.modules.wechat.service.dto.WxMaLiveInfo;
import co.yixiang.modules.wechat.service.dto.WxMaLiveResult;
import co.yixiang.tools.config.WxMaConfiguration;
import co.yixiang.utils.GsonParser;
import com.google.gson.JsonObject;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.WxType;
import me.chanjar.weixin.common.error.WxError;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 *  Created by yjwang on 2020/4/5.
 * </pre>
 *
 * @author <a href="https://github.com/yjwang3300300">yjwang</a>
 */
@Slf4j
@Service
public class WxMaLiveServiceImpl implements WxMaLiveService {

    @Value("${file.path}")
    private String uploadDirStr;
    @Override
    public Integer createRoom(WxMaLiveInfo.RoomInfo roomInfo) throws WxErrorException {
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveService.CREATE_ROOM, WxMaGsonBuilder.create().toJson(roomInfo));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return jsonObject.get("roomId").getAsInt();
    }
    /**
     * 获取直播房间列表.（分页）
     *
     * @param start 起始拉取房间，start = 0 表示从第 1 个房间开始拉取
     * @param limit 每次拉取的个数上限，不要设置过大，建议 100 以内
     * @return .
     * @throws WxErrorException .
     */
    @Override
    public WxMaLiveResult getLiveInfo(Integer start, Integer limit) throws WxErrorException {
        JsonObject jsonObject = getLiveInfo(start, limit, null);
        return WxMaLiveResult.fromJson(jsonObject.toString());
    }
    /**
     * 获取所有直播间信息（没有分页直接获取全部）
     *
     * @return .
     * @throws WxErrorException .
     */
    @Override
    public List<WxMaLiveResult.RoomInfo> getLiveInfos() throws WxErrorException {
        List<WxMaLiveResult.RoomInfo> results = new ArrayList<>();
        int start = 0;
        Integer limit = 80;
        Integer total = 0;
        WxMaLiveResult liveInfo;
        do {
            if (total != 0 && total <= start) {
                break;
            }
            liveInfo = getLiveInfo(start, limit);
            if (liveInfo == null) {
                return null;
            }
            results.addAll(liveInfo.getRoomInfos());
            total = liveInfo.getTotal();
            start = results.size();
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                log.error("InterruptedException", e);
            }
        } while (results.size() <= total);

        return results;
    }

    @Override
    public WxMaLiveResult getLiveReplay(String action, Integer roomId, Integer start, Integer limit) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(4);
        map.put("action", action);
        map.put("room_id", roomId);
        JsonObject jsonObject = getLiveInfo(start, limit, map);
        return WxMaLiveResult.fromJson(jsonObject.toString());
    }

    @Override
    public WxMaLiveResult getLiveReplay(Integer roomId, Integer start, Integer limit) throws WxErrorException {
        return getLiveReplay("get_replay", roomId, start, limit);
    }

    @Override
    public boolean addGoodsToRoom(Integer roomId, List<Integer> goodsIds) throws WxErrorException {
        Map<String, Object> map = new HashMap<>(2);
        map.put("roomId", roomId);
        map.put("ids", goodsIds);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveService.ADD_GOODS, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return true;
    }

    private JsonObject getLiveInfo(Integer start, Integer limit, Map<String, Object> map) throws WxErrorException {
        if (map == null) {
            map = new HashMap(2);
        }
        map.put("start", start);
        map.put("limit", limit);
        WxMaService wxMaService = WxMaConfiguration.getWxMaService();
        String responseContent = wxMaService.post(WxMaLiveService.GET_LIVE_INFO, WxMaGsonBuilder.create().toJson(map));
        JsonObject jsonObject = GsonParser.parse(responseContent);
        if (jsonObject.get("errcode").getAsInt() != 0) {
            throw new WxErrorException(WxError.fromJson(responseContent, WxType.MiniApp));
        }
        return jsonObject;
    }


}