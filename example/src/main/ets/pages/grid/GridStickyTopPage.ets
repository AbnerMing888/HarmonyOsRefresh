import { GridView, RefreshController, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/16
 * INTRODUCE:网格吸顶页面 案例
 * */

@Entry
@Component
struct GridStickyTopPage {
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.BOTTOM

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
    .onReachStart(() => {
      this.listPosition = RefreshPositionEnum.TOP
    })
    .onReachEnd(() => {
      this.listPosition = RefreshPositionEnum.BOTTOM
    })
    .onScrollFrameBegin((offset: number, _: ScrollState) => {
      if ((this.listPosition == RefreshPositionEnum.TOP && offset <= 0) || (
        this.listPosition == RefreshPositionEnum.BOTTOM && offset >= 0
      )
      ) {
        return { offsetRemain: 0 }
      }
      //不在底部
      this.listPosition = RefreshPositionEnum.CENTER
      return { offsetRemain: offset }
    })

  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  testLayout(type: number) {
    StickyGridView({ pageType: type, listPosition: this.listPosition })
  }
}

/*
* Author:AbnerMing
* Describe:吸顶列表
*/
@Component
struct StickyGridView {
  @State pageType: number = 0
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @Prop listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP

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
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    GridView({
      items: this.pageType == 0 ? this.arr1 : this.arr2,
      itemLayout: this.itemLayout,
      controller: this.controller,
      refreshStickyPosition: this.listPosition,
      isRefreshSticky: true,
      onRefresh: () => {
        //下拉刷新 模拟耗时
        setTimeout(() => {
          this.controller.finishRefresh()
        }, 3000)
      },
      onLoadMore: () => {
        // 上拉加载 模拟耗时
        setTimeout(() => {
          this.arr1.push(300)
          this.controller.finishLoadMore()
        }, 3000)
      }
    })
  }
}