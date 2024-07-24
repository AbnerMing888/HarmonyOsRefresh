import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:带有头的ListView
 * */

@Entry
@Component
struct ListViewHeaderPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  @State _privateRefreshContentHeight: Length = "100%" //内容视图的高度

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
  itemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  @Builder
  itemHeaderLayout(): void {
    Column() {
      Text("我是头View")
    }.height(100)
    .width("100%")
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      ActionBar({ title: "带有头的ListView" })

      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        itemHeaderLayout: this.itemHeaderLayout,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh();
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            this.controller.finishLoadMore();
          }, 3000)
        }
      })
    }
  }
}