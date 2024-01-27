<template>
  <div class="mod-task">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="listData()">
      <el-form-item>
        <el-button size="small" @click="listData()">刷新列表</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="dataList" border stripe v-loading="dataListLoading" :max-height="tableHeight"
            @selection-change="selectionChangeHandle" @sort-change="sortChangeHandle" style="width: 100%;">
      <el-table-column type="selection" header-align="center" align="center" width="50"></el-table-column>
      <el-table-column prop="id" label="ID" header-align="center" align="center"></el-table-column>
      <el-table-column prop="instanceName" label="流程名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="name" label="任务节点名称" header-align="center" align="center"></el-table-column>
      <el-table-column prop="status" label="任务状态" header-align="center" align="center"></el-table-column>
      <el-table-column prop="assignee" label="办理人" header-align="center" align="center"></el-table-column>
      <el-table-column prop="createdDate" label="创建时间" header-align="center" align="center"></el-table-column>
      <el-table-column label="操作" fixed="right" header-align="center" align="center" width="200">
        <template slot-scope="scope">
          <el-button type="success" size="small" @click="completeHandle(scope.row.id, 1)">通过</el-button>
          <el-button type="info" size="small" @click="completeHandle(scope.row.id, 0)">驳回</el-button>
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
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
  </div>
</template>

<script>
  import grid from '@/mixins/grid'
  export default {
    mixins: [grid],
    data () {
      return {
        gridOptions: {
          isQuery: false,
          listUrl: '/activiti7/task/list'
        },
        dataForm: {}
      }
    },
    methods: {
      completeHandle (taskId, isPass) {
        this.$http.json().post('/activiti7/task/complete', {
          'taskId': taskId,
          'isPass': isPass,
          'remark': ''
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
