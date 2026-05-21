import { TitleBar } from '@abner/bar'
import { LitheRefresh, RefreshController } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import router from '@ohos.router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:上拉加载，显示暂无更多
 * */
@RouterPath("example_LitheV1FooterNothingPage")
@Component
export struct LitheV1FooterNothingPage {
  @State testArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()

  aboutToAppear(): void {
    //如果你打算一进来，没有更多数据，就展示，可以使用isFooterNothing属性
    // this.controller.isFooterNothing = true
  }

  @Builder
  itemLayout() {
    List({ scroller: this.scroller, space: 20 }) {
      ForEach(this.testArray, (item: number, index: number) => {
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
        title: "显示暂无更多数据",
        leftText: "返回",
        onLeftClick: () => {
          router.back()
        },
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
            this.controller.isFooterNothing = false //关闭暂无更多数据
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.testArray.push(13)
            this.testArray.push(14)
            this.controller.finishLoadMore(true) //设置为true，显示暂无更多数据
          }, 2000)
        }
      })
    }
  }
}