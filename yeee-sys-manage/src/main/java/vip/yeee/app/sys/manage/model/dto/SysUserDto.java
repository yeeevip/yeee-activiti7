package vip.yeee.app.sys.manage.model.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import vip.yeee.app.common.domain.mysql.entity.SysUser;

import java.util.List;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/1/29 20:48
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysUserDto extends SysUser {

    private List<String> deptCodeList;
}
