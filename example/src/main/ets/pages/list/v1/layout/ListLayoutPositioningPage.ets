import { TitleBar } from '@abner/bar'
import { ListLayout, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/20
 * INTRODUCE:定位位置
 * */

@RouterPath("example_ListLayoutPositioningPage")
@Component
export struct ListLayoutPositioningPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
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
    ListItemView({
      index: index
    })
  }

  build() {
    Column() {
      TitleBar({ title: "位置定位" })
      Row() {
        Button("定位顶部")
          .backgroundColor($r("app.color.tab_select_color"))
          .borderRadius(5)
          .fontSize(14)
          .onClick(() => {
            this.controller.scrollEdge(Edge.Top)
          })
        Button("定位底部")
          .backgroundColor($r("app.color.tab_select_color"))
          .borderRadius(5)
          .fontSize(14)
          .onClick(() => {
            this.controller.scrollEdge(Edge.Bottom)
          })
          .margin({ left: 10 })
        Button("定位某一个条目")
          .backgroundColor($r("app.color.tab_select_color"))
          .borderRadius(5)
          .fontSize(14)
          .onClick(() => {
            this.controller.scrollToIndex(2)
          })
          .margin({ left: 10 })
      }.margin({ bottom: 10 })

      ListLayout({
        items: this.array,
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
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
            for (let i = 0; i < 20; i++) {
              this.array.push(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}