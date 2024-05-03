package vip.yeee.app.activiti7.manage.model;

import lombok.Data;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/5/1 15:35
 */
@Data
public class KeyIndicatorsVo {

    private Integer definitionCount;
    private Integer todayDefinitionCount;

    private Integer instanceCount;
    private Integer todayInstanceCount;

    private Integer taskCount;
    private Integer todayTaskCount;

    private Integer userCount;
    private Integer todayUserCount;
}
