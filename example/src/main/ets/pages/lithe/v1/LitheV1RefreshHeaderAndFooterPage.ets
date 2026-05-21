import { ActionBar, TitleBar } from '@abner/bar'
import router from '@ohos.router'
import {
  LitheRefresh,
  LoadMoreLayoutStatusModel,
  RefreshController,
  RefreshLayoutStatusModel
} from '@abner/refresh'
import { RouterPath } from '@abner/router'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:自定义刷新头和加载尾，支持多种类型
 * */

@RouterPath("example_LitheV1RefreshHeaderAndFooterPage")
@Component
export struct LitheV1RefreshHeaderAndFooterPage {
  @State testArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()

  @Builder
  itemLayout() {
    List({ scroller: this.scroller, space: 10 }) {
      ForEach(this.testArray, (item: number) => {
        ListItem() {
          Text('列表数据:' + item)
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

  /**
   * AUTHOR:AbnerMing
   * INTRODUCE:自定义刷新头
   * */
  @Builder
  headerRefreshLayout(model: RefreshLayoutStatusModel) {
    Column() {
      Text("" + model.status)
        .fontColor(Color.White)
    }.width("100%")
    .height(80)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r("app.color.tab_select_color"))
  }

  /**
   * AUTHOR:AbnerMing
   * INTRODUCE:自定义刷新尾部
   * */
  @Builder
  footerLoadLayout(model: LoadMoreLayoutStatusModel) {
    Column() {
      Text("" + model.status)
        .fontColor(Color.White)
    }.width("100%")
    .height(80)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r("app.color.tab_select_color"))
  }

  build() {
    Column() {
      TitleBar({
        title: "自定义刷新头和加载尾",
        leftText: "返回"
      })

      LitheRefresh({
        scroller: this.scroller,
        controller: this.controller,
        headerRefreshLayout: this.headerRefreshLayout,
        footerLoadLayout: this.footerLoadLayout,
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