import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/01/14
 * INTRODUCE:上拉加载直接显示数据，不回弹
 * */

@Entry
@Component
struct ListViewNoReboundPage {
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
      ActionBar({ title: "上拉加载不回弹" })
      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        slideDisplayLoadData: true, //设置此参数，可以让上拉完成后，不回弹，直接显示数据
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
            for (let i = 0; i < 10; i++) {
              this.array.push(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}