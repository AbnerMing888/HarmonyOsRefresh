import { ActionBar } from '../ActionBar'
import { GridView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:下拉刷新列表GridView页面
 * */

@Entry
@Component
struct GridViewRefreshPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.array.push(i)
    }
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item:Object, index:number):void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })
  }

  build() {
    Column() {
      ActionBar({ title: "下拉刷新列表GridView" })
      GridView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉，
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh()
        }
      })
    }
  }
}