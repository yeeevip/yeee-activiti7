package vip.yeee.app.sys.manage.domain.mysql.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.yeee.app.common.domain.mysql.entity.SysUser;
import vip.yeee.app.sys.manage.model.dto.SysUserDto;

import java.util.List;

/**
 * create by yeah.一页 2022/04/29 13:52:01
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
       IPage<SysUser> getList(@Param("page") Page<SysUser> page, @Param("sysUser") SysUserDto sysUser);
       SysUser getOne(SysUser sysUser);
       //int insert(SysUser sysUser);
       int updateByPrimaryKey(SysUser sysUser);
       int batchInsert(List<SysUser> sysUserList);
}




