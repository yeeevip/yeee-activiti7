<template>
  <div class="mod-definition">
    <el-form :inline="true" :model="dataForm" @keyup.enter="listData()">
      <el-form-item>
        <el-button size="default" @click="listData()">查询</el-button>
        <el-button size="default" type="primary" @click="addBpmn()">在线制作流程</el-button>
        <el-button size="default" type="danger" @click="delHandle()" :disabled="dataListSelections.length <= 0">删除</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="processDefinitionID" label="流程定义ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="name" label="流程定义名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="deploymentID" label="部署ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="resourceName" label="流程文件名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="key" label="KEY" header-align="center" align="center"></el-table-column>
      <el-table-column prop="version" label="部署版本" header-align="center" align="center"></el-table-column>
      <el-table-column label="操作" fixed="right" header-align="center" align="center" width="200">
        <template #default="scope">
          <el-button type="text" size="small" @click="lookBpmn(scope.row.deploymentID, scope.row.resourceName)" :icon="Document" title="查看"></el-button>
          <el-button type="text" size="small" @click="createInstance(scope.row.processDefinitionID)" :icon="Plus" title="新建实例"></el-button>
          <el-button type="text" size="small" @click="delHandle(scope.row.id)" :icon="Delete" title="删除"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination v-if="this.gridOptions.isPage"
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageNo"
      :page-sizes="pageSizes"
      :page-size="pageSize"
      :total="total"
      layout="->, total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  import * as index from '@/utils/index'
  import { Document, Delete, Plus } from '@element-plus/icons-vue'
  import { markRaw } from 'vue'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/definition/list',
          delUrl: '/activiti7/definition/delete',
          delKey: 'deploymentID'
        },
        dataForm: {},
        // 图标组件（使用 markRaw 避免响应式包装）
        Document: markRaw(Document),
        Delete: markRaw(Delete),
        Plus: markRaw(Plus)
      }
    },
    methods: {
      addBpmn () {
        let api = index.baseUrl2()
        let token = localStorage.getItem('yeee-manageweb-token')
        window.open(api + 'activiti-editor/index.html?type=addBpmn&tt=' + token, '_blank')
      },
      lookBpmn (depId, rName) {
        let api = index.baseUrl2()
        let token = localStorage.getItem('yeee-manageweb-token')
        window.open(api + 'activiti-editor/index.html?type=lookBpmn&deploymentFileUUID=' + depId + '&deploymentName=' + rName + '&tt=' + token, '_blank')
      },
      createInstance (pdId) {
        this.$http.json().post('/activiti7/instance/create', {
          'pdId': pdId
        }).then(({data: res}) => {
          if (res.code !== 200) {
            return this.$message.error(res.msg)
          }
          this.$message({
            message: '操作成功',
            type: 'success',
            duration: 500,
            onClose: () => {
              this.listData()
            }
          })
        }).catch(() => {})
      }
    },
    components: {
    }
  }
</script>
