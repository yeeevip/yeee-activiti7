package vip.yeee.app.activiti7.manage.domain.mysql.mapper;

import cn.hutool.core.date.DateTime;
import org.apache.ibatis.annotations.Param;
import vip.yeee.app.activiti7.manage.model.KeyIndicatorsVo;
import vip.yeee.app.activiti7.manage.model.Top5InstanceCountRecent7DayVo;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author https://www.yeee.vip
 * @since 2024-04-29
 */
public interface Activiti7StatisticsMapper {

    KeyIndicatorsVo getKeyIndicators(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

    List<Map<String, Object>> getTop5InstanceCountRecent7Day(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

    List<Map<String, Object>> getTop5InstanceCountTotal();

    List<Map<String, Object>> getTaskCountRecentDay(@Param("startTime") Date startTime, @Param("endTime") Date endTime);
}
