package co.yixiang.modules.activity.service.impl;

import co.yixiang.modules.activity.domain.YxStorePink;
import co.yixiang.utils.ValidationUtil;
import co.yixiang.modules.activity.repository.YxStorePinkRepository;
import co.yixiang.modules.activity.service.YxStorePinkService;
import co.yixiang.modules.activity.service.dto.YxStorePinkDTO;
import co.yixiang.modules.activity.service.dto.YxStorePinkQueryCriteria;
import co.yixiang.modules.activity.service.mapper.YxStorePinkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import co.yixiang.utils.PageUtil;
import co.yixiang.utils.QueryHelp;
import java.util.List;
import java.util.Map;

/**
* @author hupeng
* @date 2019-11-18
*/
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxStorePinkServiceImpl implements YxStorePinkService {

    @Autowired
    private YxStorePinkRepository yxStorePinkRepository;

    @Autowired
    private YxStorePinkMapper yxStorePinkMapper;

    @Override
    public Map<String,Object> queryAll(YxStorePinkQueryCriteria criteria, Pageable pageable){
        Page<YxStorePink> page = yxStorePinkRepository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root,criteria,criteriaBuilder),pageable);
        return PageUtil.toPage(page.map(yxStorePinkMapper::toDto));
    }

    @Override
    public List<YxStorePinkDTO> queryAll(YxStorePinkQueryCriteria criteria){
        return yxStorePinkMapper.toDto(yxStorePinkRepository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root,criteria,criteriaBuilder)));
    }

    @Override
    public YxStorePinkDTO findById(Integer id) {
        Optional<YxStorePink> yxStorePink = yxStorePinkRepository.findById(id);
        ValidationUtil.isNull(yxStorePink,"YxStorePink","id",id);
        return yxStorePinkMapper.toDto(yxStorePink.get());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public YxStorePinkDTO create(YxStorePink resources) {
        return yxStorePinkMapper.toDto(yxStorePinkRepository.save(resources));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(YxStorePink resources) {
        Optional<YxStorePink> optionalYxStorePink = yxStorePinkRepository.findById(resources.getId());
        ValidationUtil.isNull( optionalYxStorePink,"YxStorePink","id",resources.getId());
        YxStorePink yxStorePink = optionalYxStorePink.get();
        yxStorePink.copy(resources);
        yxStorePinkRepository.save(yxStorePink);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Integer id) {
        yxStorePinkRepository.deleteById(id);
    }
}