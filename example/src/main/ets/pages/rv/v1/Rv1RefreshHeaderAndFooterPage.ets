import { TitleBar } from '@abner/bar'
import {
  LoadMoreLayoutStatusModel,
  RefreshController,
  RefreshLayoutStatusModel,
  RefreshView
} from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:自定义刷新头和加载尾，支持多种类型
 * */

@RouterPath("example_Rv1RefreshHeaderAndFooterPage")
@Component
export struct Rv1RefreshHeaderAndFooterPage {
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
    List({ scroller: this.scroller }) {
      ForEach(this.testArray, (index: number) => {
        ListItem() {
          ListItemView({ index: index })
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
        title: "【自定义刷新头和加载尾】"
      })

      RefreshView({
        scroller: this.scroller,
        controller: this.controller,
        refreshHeaderAttribute: (attr) => {
          attr.height = 80 //刷新头的高度
        },
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