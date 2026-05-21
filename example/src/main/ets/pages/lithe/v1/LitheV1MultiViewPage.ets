import { LitheRefresh, RefreshController } from '@abner/refresh'
import { TitleBar } from '@abner/bar'
import router from '@ohos.router'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/10/20
 * INTRODUCE:多视图View
 * */
@RouterPath("example_LitheV1MultiViewPage")
@Component
export struct LitheV1MultiViewPage {
  @State testArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()

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
    .padding({ left: 20, right: 20 })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
  }

  build() {
    Column() {

      TitleBar({
        title: "多视图",
        leftText: "返回",
        onLeftClick: () => {
          router.back()
        },
      })

      Column() {

      }.width("100%")
      .height(100)
      .backgroundColor($r("app.color.tab_select_color"))
      .margin({ bottom: 10 })

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
          setTimeout(() => {
            this.testArray.push(13)
            this.testArray.push(14)
            this.controller.finishLoadMore()
          }, 2000)
        }
      })

    }
  }
}