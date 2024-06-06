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
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @State listPosition: number = 0

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
    }
    for (let i = 0; i < 50; i++) {
      this.arr2.push(i)
    }
  }

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
            this.testLayout(this.arr1)
          }.tabBar("Tab1")

          TabContent() {
            this.testLayout(this.arr2)
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

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  testLayout(arr: number[]) {
    ListView({
      items: arr,
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