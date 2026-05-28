import { TitleBar } from '@abner/bar'
import { LitheRefresh, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:List 组件上拉下拉
 * */
@RouterPath("example_LitheV1AutoListUpAndDownPage")
@Component
export struct LitheV1AutoListUpAndDownPage {
  @State testArray: number[] = []
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()
  private tempTimeoutId:number = -1

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.testArray.push(i)
    }
  }

  @Builder
  itemLayout() {
    List({ scroller: this.scroller, space: 10 }) {
      ForEach(this.testArray, (_: number, index: number) => {
        ListItem() {
          Text('列表数据:' + index)
            .width('100%')
            .height(50)
            .fontSize(14)
            .textAlign(TextAlign.Center)
            .fontColor($r("app.color.tab_select_color"))
            .border({ width: 1, color: $r("app.color.tab_select_color") })
        }
      }, (item: string, index: number) => JSON.stringify(item) + "_" + index)
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .width("100%")
    .height("100%")
    .padding({ left: 10, right: 10 })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
    .onReachEnd(() => {
      //滑动到最后
      this.controller.autoLoadMore()
    })
  }

  build() {
    Column() {

      TitleBar({
        title: "自动加载"
      })

      LitheRefresh({
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
          clearTimeout(this.tempTimeoutId)
          this.tempTimeoutId = setTimeout(() => {
            for (let i = 0; i < 20; i++) {
              this.testArray.push(i)
            }
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
  }
}