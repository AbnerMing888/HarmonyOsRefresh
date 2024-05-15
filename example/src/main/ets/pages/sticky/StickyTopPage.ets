import { ListView, RefreshController } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/14
 * INTRODUCE:吸顶页面
 * */

@Entry
@Component
struct StickyTopPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State arr: number[] = []
  @State listPosition: number = 0

  @Builder
  itemLayout(item: Object, _: number) {
    Text("item" + item)
      .fontSize(16)
      .width("100%")
      .height(60)
  }

  build() {
    Scroll() {
      Column() {
        Text("头View")
          .fontColor(Color.White)
          .width("100%")
          .height("40%")
          .backgroundColor(Color.Red)
          .textAlign(TextAlign.Center)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            this.testLayout()
          }.tabBar("Tab1")

          TabContent() {
            this.testLayout()
          }.tabBar("Tab2")
        }
        .vertical(false)
        .height("100%")
      }.width("100%")
    }
    .friction(0.6)
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
    // 下拉刷新相关
    .onReachStart(() => {
      this.listPosition = 0
    })
    .onScrollFrameBegin((offset: number, _: ScrollState) => {
      //设置起始位置，保障在顶部时，才能执行下拉刷新
      this.controller.markStartLocation(this.listPosition == 0)
      if (this.listPosition == 0 && offset <= 0) {
        return { offsetRemain: 0 }
      }
      this.listPosition = 1
      return { offsetRemain: offset }
    })

  }

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr.push(i)
    }
  }

  /*
  * Author:AbnerMing
  * Describe:测试布局
  */
  @Builder
  testLayout() {
    ListView({
      items: this.arr,
      itemLayout: this.itemLayout,
      controller: this.controller,
      onRefresh: () => {
        //下拉刷新
        //模拟耗时
        setTimeout(() => {
          this.controller.finishRefresh()
        }, 1000)
      },
      onLoadMore: () => {
        // 上拉加载
        //模拟耗时
        setTimeout(() => {
          this.controller.finishLoadMore()
        }, 1000)
      },
      listAttribute: (attr) => {
        attr.nestedScroll = {
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        }
      }
    })
  }
}