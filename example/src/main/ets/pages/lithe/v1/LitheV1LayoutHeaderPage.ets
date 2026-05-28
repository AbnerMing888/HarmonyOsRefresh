import { TitleBar } from '@abner/bar'
import { LitheRefresh, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:添加头组件
 * */

@RouterPath("example_LitheV1LayoutHeaderPage")
@Component
export struct LitheV1LayoutHeaderPage {
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
    List({ scroller: this.scroller, space: 20 }) {
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
    .padding({ left: 20, right: 20 })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
  }

  @Builder
  itemHeaderLayout() {
    Column() {

    }.width("100%")
    .height(80)
    .backgroundColor(Color.Red)
  }

  build() {
    Column() {

      TitleBar({
        title: "添加头组件"
      })

      LitheRefresh({
        scroller: this.scroller,
        controller: this.controller,
        itemHeaderLayout: this.itemHeaderLayout,
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
