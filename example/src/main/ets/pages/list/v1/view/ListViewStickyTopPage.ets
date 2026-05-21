import { ListView, RefreshController, RefreshPositionEnum } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/14
 * INTRODUCE:吸顶页面（普通）
 * */

@RouterPath("example_ListViewStickyTopPage")
@Component
export struct ListViewStickyTopPage {

  build() {
    Scroll() {
      Column() {
        Text("头View")
          .fontColor(Color.White)
          .width("100%")
          .height("40%")
          .backgroundColor($r("app.color.tab_select_color"))
          .textAlign(TextAlign.Center)

        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            this.testLayout(0)
          }.tabBar("Tab1")

          TabContent() {
            this.testLayout(1)
          }.tabBar("Tab2")
        }
        .vertical(false)
        .height("100%")
      }.width("100%")
    }
    .scrollBar(BarState.Off)
    .width('100%')

  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  testLayout(type: number) {
    StickyListView({ pageType: type})
  }
}

/*
* Author:AbnerMing
* Describe:吸顶列表
*/
@Component
struct StickyListView {
  @State pageType: number = 0
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
    }
    for (let i = 0; i < 30; i++) {
      this.arr2.push(i)
    }
  }

  @Builder
  itemLayout(_: Object, index: number) {
    ListItemView({ index: index })
  }

  build() {
    ListView({
      items: this.pageType == 0 ? this.arr1 : this.arr2,
      itemLayout: this.itemLayout,
      controller: this.controller,
      isRefreshSticky: true, //吸顶
      listNestedScroll: {
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      }
    })
  }
}