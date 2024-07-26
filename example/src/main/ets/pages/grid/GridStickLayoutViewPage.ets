import { GridView, RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/16
 * INTRODUCE:任意组件之，使用RefreshLayout做顶部吸顶
 * */

@Entry
@Component
struct GridStickLayoutViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @State gridPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  @State gridNestedScroll?: NestedScrollOptions = {
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
  itemLayout(_this: GridStickLayoutViewPage) {
    Column() {
      //可以设置任意的组件视图
      Text("头View")
        .fontColor(Color.White)
        .width("100%")
        .height("30%")
        .backgroundColor(Color.Pink)
        .textAlign(TextAlign.Center)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          this.testLayout(this, this.arr1)
        }.tabBar("Tab1")

        TabContent() {
          this.testLayout(this, this.arr2)
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
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  @Builder
  testLayout(_this: GridStickLayoutViewPage, arr: number[]) {
    //可以是任意的列表等组件
    GridView({
      enableScrollInteraction: _this.enableScrollInteraction,
      items: arr, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemLayout: _this.listItemLayout,
      prohibitRefresh: true,
      gridNestedScroll: _this.gridNestedScroll,
      onGridRefreshPosition: (position) => {
        //获取ListView的位置
        _this.gridPosition = position
      }
    })
  }

  build() {
    Column() {
      RefreshLayout({
        itemLayout: () => {
          this.itemLayout(this)
        },
        controller: this.controller,
        refreshPosition: this.gridPosition, //定位位置
        isRefreshTopSticky: true, //是否顶部吸顶
        enableScrollInteraction: (isInteraction) => {
          this.enableScrollInteraction = isInteraction
        },
        onStickyNestedScroll: (nestedScroll: NestedScrollOptions) => {
          this.gridNestedScroll = nestedScroll
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
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }

  }
}
