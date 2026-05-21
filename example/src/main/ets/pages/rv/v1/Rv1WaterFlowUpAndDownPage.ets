import { RefreshController, RefreshDataSource, RefreshView } from '@abner/refresh'
import { TitleBar } from '@abner/bar'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:WaterFlow 组件上拉下拉
 * */
@RouterPath("example_Rv1WaterFlowUpAndDownPage")
@Component
export struct Rv1WaterFlowUpAndDownPage {
  @State colors: ResourceColor[] = ["#ee6d82", "#e5682f", "#eeb272", "#cbb41b", "#d86fea", "#5f97ea"]
  @State minSize: number = 80
  @State maxSize: number = 180
  @State fontSize: number = 24
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()
  dataSource: RefreshDataSource = new RefreshDataSource()

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 30; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
      this.dataSource.pushData(i)
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  @Builder
  itemLayout() {
    WaterFlow({ scroller: this.scroller }) {
      LazyForEach(this.dataSource, (item: number) => {
        FlowItem() {
          Column() {
            Text("条目数据" + item)
          }.justifyContent(FlexAlign.Center)
        }
        .width('100%')
        .height(this.itemHeightArray[item % 30])
        .backgroundColor(this.colors[item % 5])
      }, (item: string) => item)
    }
    .columnsTemplate("1fr 1fr")
    .columnsGap(10)
    .rowsGap(5)
    .width('100%')
    .height('100%')
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
  }

  build() {
    Column() {

      TitleBar({
        title: "WaterFlow组件刷新"
      })

      RefreshView({
        scroller: this.scroller,
        controller: this.controller,
        itemLayout: () => {
          this.itemLayout()
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.setItemSizeArray()
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
  }
}
