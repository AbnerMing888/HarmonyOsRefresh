import { ListView, RefreshController, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/26
 * INTRODUCE:吸顶页面 -- 任意布局
 * */

@Entry
@Component
struct ArbitrarilyStickyTopPage {
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

        Column() {

          Text("我是固定视图")
            .fontColor(Color.White)
            .width("100%")
            .height(60)
            .backgroundColor(Color.Pink)
            .textAlign(TextAlign.Center)

          StickyListView({ listPosition: this.listPosition })
        }.width("100%")
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
}

/*
* Author:AbnerMing
* Describe:吸顶列表
*/
@Component
struct StickyListView {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @Prop listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
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
    ListView({
      items: this.arr1,
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
          this.controller.finishLoadMore()
        }, 3000)
      }
    })
  }
}