package vip.yeee.app.activiti7.manage.biz;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Component;
import vip.yeee.app.activiti7.manage.domain.mysql.mapper.Activiti7StatisticsMapper;
import vip.yeee.app.activiti7.manage.model.KeyIndicatorsVo;
import vip.yeee.app.activiti7.manage.model.TaskCountRecent3DayVo;
import vip.yeee.app.activiti7.manage.model.TaskCountRecent7DayVo;
import vip.yeee.app.activiti7.manage.model.Top5InstanceCountRecent7DayVo;
import vip.yeee.app.activiti7.manage.model.Top5InstanceCountTotalVo;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * description......
 *
 * @author yeeee
 * @since 2024/4/30 21:22
 */
@Component
public class Activiti7StatisticsBiz {

    @Resource
    private Activiti7StatisticsMapper activiti7StatisticsMapper;

    public KeyIndicatorsVo getKeyIndicators() {
        Date now = new Date();
        return activiti7StatisticsMapper.getKeyIndicators(DateUtil.beginOfDay(now), DateUtil.endOfDay(now));
    }

    public Top5InstanceCountRecent7DayVo getTop5InstanceCountRecent7Day() {
        Top5InstanceCountRecent7DayVo top5InstanceCountRecent7DayVo = new Top5InstanceCountRecent7DayVo();

        Date yesterday = DateUtil.yesterday();
        Date sevenDayAgo = DateUtil.offsetDay(yesterday, -6);
        List<Map<String, Object>> dataMap = activiti7StatisticsMapper.getTop5InstanceCountRecent7Day(DateUtil.beginOfDay(sevenDayAgo), DateUtil.endOfDay(yesterday));

        List<String> dateList = DateUtil.rangeToList(sevenDayAgo, yesterday, DateField.DAY_OF_MONTH)
                .stream()
                .map(dateTime -> DateUtil.format(dateTime, DatePattern.NORM_DATE_PATTERN))
                .collect(Collectors.toList());
        top5InstanceCountRecent7DayVo.setDateList(dateList);

        Map<String, List<Map<String, Object>>> listMap = dataMap.stream()
                .collect(Collectors.groupingBy(map -> map.get("name").toString()));

        Map<String, List<Object>> defDayCountMap = Maps.newHashMap();
        for (Map.Entry<String, List<Map<String, Object>>> e : listMap.entrySet()) {
            List<Map<String, Object>> dataList = e.getValue();
            Map<Object, Object> dateCountMap = dataList.stream()
                    .collect(Collectors.toMap(map -> map.get("createTime"), map -> map.get("count")));
            List<Object> countList = dateList.stream()
                    .map(d -> Optional.ofNullable(dateCountMap.get(d)).orElse(0))
                    .collect(Collectors.toList());
            defDayCountMap.put(e.getKey(), countList);
        }
        top5InstanceCountRecent7DayVo.setDefDayCountMap(defDayCountMap);

        top5InstanceCountRecent7DayVo.setDefNameList(Lists.newArrayList(listMap.keySet()));

        return top5InstanceCountRecent7DayVo;
    }

    public Top5InstanceCountTotalVo getTop5InstanceCountTotal() {
        Top5InstanceCountTotalVo top5InstanceCountTotalVo = new Top5InstanceCountTotalVo();
        List<String> defNameList = Lists.newArrayList();
        Map<String, Object> defCountMap = Maps.newHashMap();

        List<Map<String, Object>> dataMap = activiti7StatisticsMapper.getTop5InstanceCountTotal();

        for (Map<String, Object> data : dataMap) {
            defNameList.add(data.get("name").toString());
            defCountMap.put(data.get("name").toString(), data.get("count"));
        }

        top5InstanceCountTotalVo.setDefNameList(defNameList);
        top5InstanceCountTotalVo.setDefCountMap(defCountMap);
        return top5InstanceCountTotalVo;
    }

    public TaskCountRecent3DayVo getTaskCountRecent3Day() {

        TaskCountRecent3DayVo taskCountRecent3DayVo = new TaskCountRecent3DayVo();

        Date yesterday = DateUtil.yesterday();
        Date threeDayAgo = DateUtil.offsetDay(yesterday, -2);

        List<String> dateList = DateUtil.rangeToList(threeDayAgo, yesterday, DateField.DAY_OF_MONTH)
                .stream()
                .map(dateTime -> DateUtil.format(dateTime, DatePattern.NORM_DATE_PATTERN))
                .collect(Collectors.toList());
        taskCountRecent3DayVo.setDateList(dateList);

        List<Map<String, Object>> dataList = activiti7StatisticsMapper.getTaskCountRecentDay(DateUtil.beginOfDay(threeDayAgo), DateUtil.endOfDay(yesterday));
        Map<String, Map<String, Object>> dateCountMap = dataList.stream()
                .collect(Collectors.toMap(map -> map.get("createTime").toString(), map -> map));

        Map<String, Map<String, Object>> taskCountMap = Maps.newHashMap();
        for (String date : dateList) {
            taskCountMap.put(date, Optional.ofNullable(dateCountMap.get(date)).orElseGet(() -> {
                Map<String, Object> map = Maps.newHashMap();
                map.put("createTime", date);
                map.put("totalCount", 0);
                map.put("completedCount", 0);
                return map;
            }));
        }
        taskCountRecent3DayVo.setTaskCountMap(taskCountMap);

        return taskCountRecent3DayVo;
    }

    public TaskCountRecent7DayVo getTaskCountRecent7Day() {
        TaskCountRecent7DayVo taskCountRecent7DayVo = new TaskCountRecent7DayVo();

        Date yesterday = DateUtil.yesterday();
        Date sevenDayAgo = DateUtil.offsetDay(yesterday, -6);

        List<String> dateList = DateUtil.rangeToList(sevenDayAgo, yesterday, DateField.DAY_OF_MONTH)
                .stream()
                .map(dateTime -> DateUtil.format(dateTime, DatePattern.NORM_DATE_PATTERN))
                .collect(Collectors.toList());
        taskCountRecent7DayVo.setDateList(dateList);

        List<Map<String, Object>> dataList = activiti7StatisticsMapper.getTaskCountRecentDay(DateUtil.beginOfDay(sevenDayAgo), DateUtil.endOfDay(yesterday));
        Map<String, Map<String, Object>> dateCountMap = dataList.stream()
                .collect(Collectors.toMap(map -> map.get("createTime").toString(), map -> map));

        List<Object> totalCountList = Lists.newArrayList();
        List<Object> completedCountList = Lists.newArrayList();
        for (String date : dateList) {
            Map<String, Object> map = dateCountMap.get(date);
            totalCountList.add(map == null ? 0 : map.get("totalCount"));
            completedCountList.add(map == null ? 0 : map.get("completedCount"));
        }
        taskCountRecent7DayVo.setTotalCountList(totalCountList);
        taskCountRecent7DayVo.setCompletedCountList(completedCountList);

        return taskCountRecent7DayVo;
    }
}
