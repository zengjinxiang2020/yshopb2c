package co.yixiang.modules.user.service.impl;

import cn.hutool.core.util.ObjectUtil;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.user.entity.YxSystemUserTask;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.entity.YxUserLevel;
import co.yixiang.modules.user.mapper.YxSystemUserTaskMapper;
import co.yixiang.modules.user.mapper.YxUserLevelMapper;
import co.yixiang.modules.user.service.YxSystemUserLevelService;
import co.yixiang.modules.user.service.YxSystemUserTaskService;
import co.yixiang.modules.user.service.YxUserLevelService;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.web.dto.UserLevelInfoDTO;
import co.yixiang.modules.user.web.param.YxUserLevelQueryParam;
import co.yixiang.modules.user.web.vo.YxSystemUserLevelQueryVo;
import co.yixiang.modules.user.web.vo.YxUserLevelQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.utils.OrderUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;
import java.util.List;


/**
 * <p>
 * 用户等级记录表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-12-06
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxUserLevelServiceImpl extends BaseServiceImpl<YxUserLevelMapper, YxUserLevel> implements YxUserLevelService {

    @Autowired
    private YxUserLevelMapper yxUserLevelMapper;

    @Autowired
    private YxUserService userService;

    @Autowired
    private YxSystemUserLevelService systemUserLevelService;

    @Autowired
    private YxSystemUserTaskMapper yxSystemUserTaskMapper;

    @Autowired
    private YxSystemUserTaskService systemUserTaskService;

    /**
     * 设置会员等级
     * @param uid
     * @param levelId
     */
    @Override
    public void setUserLevel(int uid, int levelId){
        YxSystemUserLevelQueryVo systemUserLevelQueryVo = systemUserLevelService
                .getYxSystemUserLevelById(levelId);
        if(ObjectUtil.isNull(systemUserLevelQueryVo)) return;

        int validTime = systemUserLevelQueryVo.getValidDate() * 86400;

        QueryWrapper<YxUserLevel> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("status",1).eq("uid",uid)
                .eq("level_id",levelId).last("limit 1");
        YxUserLevel userLevel = yxUserLevelMapper.selectOne(wrapper);
        if(ObjectUtil.isNotNull(userLevel)){
            //todo
        }else{
            YxUserLevel yxUserLevel = new YxUserLevel();
            yxUserLevel.setIsForever(systemUserLevelQueryVo.getIsForever());
            yxUserLevel.setStatus(1);
            yxUserLevel.setIsDel(0);
            yxUserLevel.setGrade(systemUserLevelQueryVo.getGrade());
            yxUserLevel.setUid(uid);
            yxUserLevel.setAddTime(OrderUtil.getSecondTimestampTwo());
            yxUserLevel.setLevelId(levelId);
            yxUserLevel.setDiscount(systemUserLevelQueryVo.getDiscount().intValue());

            if(systemUserLevelQueryVo.getIsForever() == 1){
                yxUserLevel.setValidTime(0);
            }else{
                yxUserLevel.setValidTime(validTime+OrderUtil.getSecondTimestampTwo());
            }

            yxUserLevel.setMark("恭喜你成为了"+systemUserLevelQueryVo.getName());
            yxUserLevelMapper.insert(yxUserLevel);

            YxUser yxUser = new YxUser();
            yxUser.setLevel(levelId);
            yxUser.setUid(uid);
            userService.updateById(yxUser);
        }

    }

    /**
     * 检查是否能成为会员
     * @param uid
     */
    @Override
    public void setLevelComplete(int uid) {
        YxUserQueryVo userQueryVo =  userService.getYxUserById(uid);
        if(ObjectUtil.isNull(userQueryVo)) return;

        int levelId = getUserLevel(uid,9);

        int nextLevelId = systemUserLevelService.getNextLevelId(levelId);
        if(nextLevelId == 0) return;

        //QueryWrapper<YxSystemUserTask> wrapper = new QueryWrapper<>();
        //wrapper.eq("level_id",nextLevelId).eq("is_show",1);
       // List<YxSystemUserTask> taskList = yxSystemUserTaskMapper.selectList(wrapper);

        int finishCount = systemUserTaskService.getTaskComplete(nextLevelId,uid);
        if(finishCount == 3){
            setUserLevel(uid,nextLevelId);
        }


    }

    @Override
    public UserLevelInfoDTO getUserLevelInfo(int id) {
        return yxUserLevelMapper.getUserLevelInfo(id);
    }

    /**
     * 获取当前用户会员等级返回当前用户等级id
     * @param uid
     * @param grade
     * @return
     */
    @Override
    public int getUserLevel(int uid, int grade) {
        QueryWrapper<YxUserLevel> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("status",1)
                .eq("uid",uid).orderByDesc("grade");
        if(grade > 0) wrapper.lt("grade",grade);
        YxUserLevel userLevel = yxUserLevelMapper.selectOne(wrapper);
        if(ObjectUtil.isNull(userLevel)) return 0;
        if(userLevel.getIsForever() == 1) return userLevel.getId();
        int nowTime = OrderUtil.getSecondTimestampTwo();
        if(nowTime > userLevel.getValidTime()){
            if(userLevel.getStatus() == 1){
                userLevel.setStatus(0);
                yxUserLevelMapper.updateById(userLevel);
            }

            return getUserLevel(uid,userLevel.getGrade());
        }
        return userLevel.getId();
    }

    @Override
    public YxUserLevelQueryVo getYxUserLevelById(Serializable id) throws Exception{
        return yxUserLevelMapper.getYxUserLevelById(id);
    }

    @Override
    public Paging<YxUserLevelQueryVo> getYxUserLevelPageList(YxUserLevelQueryParam yxUserLevelQueryParam) throws Exception{
        Page page = setPageParam(yxUserLevelQueryParam,OrderItem.desc("create_time"));
        IPage<YxUserLevelQueryVo> iPage = yxUserLevelMapper.getYxUserLevelPageList(page,yxUserLevelQueryParam);
        return new Paging(iPage);
    }

}
