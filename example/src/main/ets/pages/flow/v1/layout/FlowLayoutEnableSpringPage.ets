import { TitleBar } from '@abner/bar'
import { RefreshController, RefreshDataSource, StaggeredGridView, WaterFlowLayout } from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/20
 * INTRODUCE:禁止刷新和加载后，也支持阻尼效果
 * */

@RouterPath("example_FlowLayoutEnableSpringPage")
@Component
export struct FlowLayoutEnableSpringPage {
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
    this.initData()
  }

  initData() {
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
      TitleBar({ title: "刷新加载禁止后支持阻尼" })
      WaterFlowLayout({
        lazyDataSource: this.lazyDataSource,
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
            for (let i = 0; i < 20; i++) {
              this.itemHeightArray.push(this.getSize())
              this.lazyDataSource.pushData(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}