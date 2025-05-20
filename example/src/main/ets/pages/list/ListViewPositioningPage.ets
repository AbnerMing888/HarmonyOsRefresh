import { ActionBar } from '../ActionBar'
import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/20
 * INTRODUCE:定位位置
 * */

@Entry
@Component
struct ListViewPositioningPage {
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
      ActionBar({ title: "位置定位" })
      Row() {
        Button("定位顶部")
          .onClick(() => {
            this.controller.scrollEdge(Edge.Top)
          })
        Button("定位底部")
          .onClick(() => {
            this.controller.scrollEdge(Edge.Bottom)
          })
        Button("定位某一个条目")
          .onClick(() => {
            this.controller.scrollToIndex(2)
          })
      }

      ListView({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        listAttribute: (list) => {
          list.height = "100%"
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