import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/20
 * INTRODUCE:禁止刷新和加载后，也支持阻尼效果
 * */

@Entry
@Component
struct ListViewEnableSpringPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
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
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "刷新加载禁止后支持阻尼" })
      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        enableRefresh: false,
        enableLoadMore: false,
        isEnableRefreshSpring: true,
        isEnableLoadMoreSpring: true,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            this.array.push(100)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}