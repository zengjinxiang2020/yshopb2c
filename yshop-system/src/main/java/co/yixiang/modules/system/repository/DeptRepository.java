/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.system.repository;

import co.yixiang.modules.system.domain.Dept;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Set;

/**
* @author hupeng
* @date 2019-03-25
*/
@SuppressWarnings("all")
public interface DeptRepository extends JpaRepository<Dept, Long>, JpaSpecificationExecutor<Dept> {

    /**
     * 根据 PID 查询
     * @param id pid
     * @return /
     */
    List<Dept> findByPid(Long id);

    /**
     * 根据ID查询名称
     * @param id ID
     * @return /
     */
    @Query(value = "select name from dept where id = ?1",nativeQuery = true)
    String findNameById(Long id);

    /**
     * 根据角色ID 查询
     * @param id 角色ID
     * @return /
     */
    Set<Dept> findByRoles_Id(Long id);
}
