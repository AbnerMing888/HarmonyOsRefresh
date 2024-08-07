import { ActionBar } from '../ActionBar'
import { GridView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/16
 * INTRODUCE:带有尾的GridView页面
 * */

@Entry
@Component
struct GridViewFooterPage {
  controller: RefreshController = new RefreshController() //刷新控制器
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
  itemLayout(item: Object, _: number): void {
    Text("测试数据" + item.toString())
      .width("95%")
      .height(50)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .margin({ top: 10 })
  }

  @Builder
  itemFooterLayout(): void {
    Column() {
      Text("我是尾View")
    }.height(100)
    .width("100%")
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      ActionBar({ title: "带有尾的GridView" })
      GridView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉，
        itemFooterLayout: this.itemFooterLayout,
        isLazyData: false,
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