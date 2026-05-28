import {  RefreshController, RefreshHeaderType, RefreshView } from '@abner/refresh'
import { TitleBar } from '@abner/bar'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/10/27
 * INTRODUCE:刷新 三个小圆点
 * */
@RouterPath("example_Rv1RefreshPointPage")
@Component
export struct Rv1RefreshPointPage {
  @State testArray: number[] = []
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()
  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.testArray.push(i)
    }
  }

  @Builder
  itemLayout() {
    List({ scroller: this.scroller, space: 10 }) {
      ForEach(this.testArray, (item: number) => {
        ListItem() {
          Text('' + item)
            .width('100%')
            .height(80)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xFFFFFF)
            .border({ width: 2, color: Color.Pink })
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
  }

  build() {
    Column() {

      TitleBar({
        title: "【三个小圆点刷新】"
      })

      RefreshView({
        scroller: this.scroller,
        controller: this.controller,
        refreshHeaderAttribute: (header) => {
          header.headerType = RefreshHeaderType.POINTS //三个小圆点
        },
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