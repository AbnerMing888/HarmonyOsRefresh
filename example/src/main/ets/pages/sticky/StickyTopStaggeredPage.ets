import { RefreshController, RefreshPositionEnum, StaggeredGridView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/14
 * INTRODUCE:吸顶页面-瀑布流方式
 * */


@Entry
@Component
struct StickyTopStaggeredPage {
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
    .friction(0.6)
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
    // 下拉刷新相关
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
    StickyStaggeredView({ pageType: type, listPosition: this.listPosition })
  }
}

/*
* Author:AbnerMing
* Describe:瀑布流页面
*/
@Component
struct StickyStaggeredView {
  @State pageType: number = 0
  @Prop listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  private itemHeightArray: number[] = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State minSize: number = 80
  @State maxSize: number = 180

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
    }
    for (let i = 0; i < 50; i++) {
      this.arr2.push(i)
    }
    this.setItemSizeArray()
  }

  @Builder
  itemLayout(_this: StickyStaggeredView, _: Object, index: number) {
    Column() {
      Text("测试数据" + index)
    }.width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
  }

  build() {
    StaggeredGridView({
      items: this.pageType == 0 ? this.arr1 : this.arr2,
      itemLayout: (item: Object, index: number) => {
        this.itemLayout(this, item, index)
      },
      controller: this.controller,
      isRefreshSticky: true,
      refreshStickyPosition: this.listPosition,
      onRefresh: () => {
        //下拉刷新
        setTimeout(() => {
          this.controller.finishRefresh()
        }, 1000)
      },
      onLoadMore: () => {
        // 上拉加载 模拟耗时
        setTimeout(() => {
          this.controller.finishLoadMore()
        }, 1000)
      }
    })
  }
}