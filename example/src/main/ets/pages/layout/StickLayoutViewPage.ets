import { ListView, RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/6/20
 * INTRODUCE:任意组件之，使用RefreshLayout做吸顶组件
 * */

@Entry
@Component
struct StickLayoutViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  @State refreshPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  scroller?: Scroller = new Scroller()
  @State listNestedScroll?: NestedScrollOptions = undefined

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
  itemLayout(_this: StickLayoutViewPage) {
    Scroll() {
      Column() {
        //可以设置任意的组件视图
        Text("头View")
          .fontColor(Color.White)
          .width("100%")
          .height("30%")
          .backgroundColor(Color.Red)
          .textAlign(TextAlign.Center)

        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            this.testLayout(this, this.arr1)
          }.tabBar("Tab1")

          TabContent() {
            this.testLayout(this, this.arr2)
          }.tabBar("Tab2")
        }
        .vertical(false)
        .height("100%")
      }.width("100%")
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .friction(0.6)
    .onReachStart(() => {
      this.listPosition = RefreshPositionEnum.TOP
    })
    .onScrollFrameBegin((offset: number, _: ScrollState) => {
      //设置起始位置，保障在顶部时，才能执行下拉刷新
      if (this.listPosition == 0 && offset <= 0) {
        return { offsetRemain: 0 }
      }
      this.listPosition = RefreshPositionEnum.CENTER
      return { offsetRemain: offset }
    })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
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
  testLayout(_this: StickLayoutViewPage, arr: number[]) {
    //可以是任意的列表等组件
    ListView({
      items: arr, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemLayout: _this.listItemLayout,
      scroller: _this.scroller,
      listNestedScroll: _this.listNestedScroll,
      onListRefreshPosition: (position) => {
        //获取ListView的位置
        _this.refreshPosition = position
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
        refreshPosition: this.refreshPosition, //定位位置
        isRefreshSticky: true, //是否吸顶
        refreshStickyPosition: this.listPosition, //吸顶位置
        childScroller: this.scroller,
        onNestedScroll: (nestedScroll: NestedScrollOptions) => {
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
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }

  }
}