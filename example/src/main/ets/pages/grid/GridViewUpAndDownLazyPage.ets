import { ActionBar } from '../ActionBar'
import { GridView, RefreshController, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:下拉上下列表GridView页面  懒加载数据
 * */

@Entry
@Component
struct GridViewUpAndDownPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource() //懒加载数据

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
    }
    this.lazyDataSource.initData(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })
  }

  build() {
    Column() {
      ActionBar({ title: "刷新加载列表GridView" })
      GridView({
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉，
        lazyDataSource: this.lazyDataSource,
        gridAttribute: (g) => {
          g.rowsGap = 10 //设置行间距
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}