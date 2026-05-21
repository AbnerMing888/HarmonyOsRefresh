import { ListView, RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 *AUTHOR:AbnerMing
 *DATE:2026/4/23
 *INTRODUCE:页面吸顶案例三，页面顶部刷新
 */
@RouterPath("example_ListLayoutStickPage")
@Component
export struct ListLayoutStickPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  @State listNestedScroll?: NestedScrollOptions = {
    scrollForward: NestedScrollMode.PARENT_FIRST,
    scrollBackward: NestedScrollMode.SELF_FIRST
  }
  @State enableScrollInteraction: boolean = true

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
    }
    for (let i = 0; i < 50; i++) {
      this.arr2.push(i)
    }
  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  itemLayout() {
    Column() {
      //可以设置任意的组件视图
      Text("头View")
        .fontColor(Color.White)
        .width("100%")
        .height("30%")
        .backgroundColor($r("app.color.tab_select_color"))
        .textAlign(TextAlign.Center)

      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          this.testLayout(0)
        }.tabBar("Tab1")

        TabContent() {
          this.testLayout(1)
        }.tabBar("Tab2")
      }.vertical(false)
    }
  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */

  @Builder
  listItemLayout(_: Object, index: number) {
    ListItemView({ index: index })
  }

  @Builder
  testLayout(type: number) {
    //可以是任意的列表等组件
    ListView({
      enableScrollInteraction: this.enableScrollInteraction,
      items: type == 0 ? this.arr1 : this.arr2, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemLayout: this.listItemLayout,
      prohibitRefresh: true,
      isRefreshSticky: true,
      listNestedScroll: this.listNestedScroll,
      onListRefreshPosition: (position) => {
        //获取ListView的位置
        this.listPosition = position
      }
    })
  }

  build() {
    Column() {
      RefreshLayout({
        itemLayout: () => {
          this.itemLayout()
        },
        controller: this.controller,
        refreshPosition: this.listPosition, //定位位置
        isRefreshTopSticky: true, //是否顶部吸顶
        enableScrollInteraction: (isInteraction) => {
          this.enableScrollInteraction = isInteraction
        },
        onStickyNestedScroll: (nestedScroll: NestedScrollOptions) => {
          this.listNestedScroll = nestedScroll
        },
        onRefresh: () => {
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          setTimeout(() => {
            //模拟耗时
            this.arr1.push(100)
            this.arr1.push(101)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}