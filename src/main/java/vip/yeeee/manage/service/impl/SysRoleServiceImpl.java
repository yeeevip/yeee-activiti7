package vip.yeeee.manage.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import vip.yeee.memo.integrate.common.model.exception.BizException;
import vip.yeee.memo.integrate.common.model.vo.PageVO;
import vip.yeee.memo.integrate.common.mybatisplus.warpper.MyPageWrapper;
import vip.yeee.memo.integrate.common.security.utils.SecurityUtil;
import vip.yeeee.manage.convert.SysRoleConvert;
import vip.yeeee.manage.domain.mysql.mapper.SysRoleMapper;
import vip.yeeee.manage.domain.mysql.mapper.SysRoleMenuMapper;
import vip.yeeee.manage.domain.mysql.mapper.SysUserRoleMapper;
import vip.yeeee.manage.domain.mysql.entity.SysRole;
import vip.yeeee.manage.domain.mysql.entity.SysRoleMenu;
import vip.yeeee.manage.domain.mysql.entity.SysUserRole;
import vip.yeeee.manage.model.vo.SysRoleHasSetVO;
import vip.yeeee.manage.model.vo.SysRoleVO;
import vip.yeeee.manage.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * description......
 *
 * @author yeeee
 * @since 2022/5/28 18:09
 */
@RequiredArgsConstructor
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

    private final SysRoleConvert sysRoleConvert;

    private final SysUserRoleMapper sysUserRoleMapper;

    private final SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public PageVO<SysRoleVO> sysRolePageList(String query) {
        MyPageWrapper<SysRole> pageWrapper = new MyPageWrapper<>(query);
        IPage<SysRole> page = this.page(pageWrapper.getPage(), pageWrapper.getQueryWrapper());
        List<SysRoleVO> roleVOList = page.getRecords()
                .stream()
                .map(sysRoleConvert::entity2VO)
                .collect(Collectors.toList());
        return new PageVO<>((int)page.getCurrent(), (int)page.getSize(), (int)page.getPages(), page.getTotal(), roleVOList);
    }

    @Override
    public boolean sysRoleExist(String query) {
        MyPageWrapper<SysRole> pageWrapper = new MyPageWrapper<>(query);
        return this.count(pageWrapper.getQueryWrapper()) > 0;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Void addSysRole(SysRoleVO editVO) {
        SysRole sysRole = sysRoleConvert.vo2Entity(editVO);
        this.save(sysRole);
        if (CollectionUtil.isNotEmpty(editVO.getRscoIdList())) {
            this.setSysRoleMenus(editVO.getRscoIdList(), sysRole.getId());
        }
        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Void editSysRole(SysRoleVO editVO) {
        Integer roleId = editVO.getId();
        SysRole sysRole = this.getById(roleId);
        if (sysRole == null) {
            throw new BizException("角色不存在");
        }
        SysRole upd = sysRoleConvert.vo2Entity(editVO);
        this.updateById(upd);
        sysRoleMenuMapper.delete(Wrappers.<SysRoleMenu>lambdaQuery().eq(SysRoleMenu::getRoleId, roleId));
        if (CollectionUtil.isNotEmpty(editVO.getRscoIdList())) {
            this.setSysRoleMenus(editVO.getRscoIdList(), roleId);
        }
        return null;
    }

    private void setSysRoleMenus(List<Long> rscoList, Integer roleId) {
        List<SysRoleMenu> roleMenuList = rscoList
                .stream()
                .map(rsco -> {
                    SysRoleMenu sysRoleMenu = new SysRoleMenu();
                    sysRoleMenu.setRoleId(roleId);
                    sysRoleMenu.setMenuId(rsco);
                    String username = SecurityUtil.currentSecurityUser().getUsername();
                    Date date = new Date();
                    sysRoleMenu.setCreateTime(date);
                    sysRoleMenu.setCreateBy(username);
                    sysRoleMenu.setUpdateTime(date);
                    sysRoleMenu.setUpdateBy(username);
                    return sysRoleMenu;
                })
                .collect(Collectors.toList());
        sysRoleMenuMapper.batchInsert(roleMenuList);
    }

    @Override
    public SysRoleVO sysRoleInfo(SysRoleVO editVO) {
        SysRole sysRole = this.getById(editVO.getId());
        if (sysRole == null) {
            throw new BizException("角色不存在");
        }
        return sysRoleConvert.entity2VO(sysRole);
    }

    @Override
    public Void delSysRole(SysRoleVO editVO) {
        this.removeByIds(editVO.getIds());
        return null;
    }

    @Override
    public SysRoleHasSetVO sysRoleListAndHasSet(Integer userId) {
        SysRoleHasSetVO roleHasSetVO = new SysRoleHasSetVO();
        List<SysUserRole> userRoles = userId != null ? sysUserRoleMapper.getList(new SysUserRole().setUserId(userId)) : Collections.emptyList();
        roleHasSetVO.setCheckedKeys(Optional.ofNullable(userRoles).orElseGet(Lists::newArrayList)
                .stream()
                .map(SysUserRole::getRoleId)
                .collect(Collectors.toSet()));
        List<SysRole> sysRoleList = this.list();
        List<SysRoleHasSetVO.RoleVO> roleVOList = sysRoleList
                .stream()
                .map(sysRoleConvert::entity2SetVO)
                .collect(Collectors.toList());
        roleHasSetVO.setList(roleVOList);
        return roleHasSetVO;
    }
}
