import { TitleBar } from '@abner/bar'
import { RefreshController, RefreshDataSource, WaterFlowLayout } from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/20
 * INTRODUCE:定位位置
 * */

@RouterPath("example_FlowLayoutPositioningPage")
@Component
export struct FlowLayoutPositioningPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  lazyDataSource: RefreshDataSource = new RefreshDataSource()
  private itemHeightArray: number[] = []
  @State colors: ResourceColor[] = ["#ee6d82", "#e5682f", "#eeb272", "#cbb41b", "#d86fea", "#5f97ea"]
  @State minSize: number = 80
  @State maxSize: number = 180

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
      this.itemHeightArray.push(this.getSize())
    }
    this.lazyDataSource.pushDataArray(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    Column() {
      Text("列表数据:" + index)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
  }

  build() {
    Column() {
      TitleBar({ title: "位置定位(WaterFlowLayout)" })
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

      WaterFlowLayout({
        lazyDataSource: this.lazyDataSource,
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
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}