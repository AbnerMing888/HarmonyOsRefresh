import { RefreshController, RefreshDataSource, RefreshPositionEnum, StaggeredGridView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/8/21
 * INTRODUCE:吸顶页面 -- 任意布局
 * */

@Entry
@Component
struct ArbitrarilyStaggeredStickyTopPage {
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.BOTTOM

  build() {
    Scroll() {
      Column() {
        Text("任意布局")
          .fontColor(Color.White)
          .width("100%")
          .height("40%")
          .backgroundColor(Color.Red)
          .textAlign(TextAlign.Center)
        Column() {
          StickyStaggeredView({ listPosition: this.listPosition })
        }.width("100%")

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
        this.listPosition == RefreshPositionEnum.BOTTOM && offset >= 0)) {
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
* Describe:瀑布流页面
*/
@Component
struct StickyStaggeredView {
  @Prop listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  controller: RefreshController = new RefreshController() //刷新控制器
  private itemHeightArray: number[] = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State minSize: number = 80
  @State maxSize: number = 180
  lazyDataSource?: RefreshDataSource = new RefreshDataSource()

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
      this.lazyDataSource?.pushData(i)
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
      itemLayout: (item: Object, index: number) => {
        this.itemLayout(this, item, index)
      },
      controller: this.controller,
      lazyDataSource: this.lazyDataSource,
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
          this.lazyDataSource?.pushData(100)
          this.controller.finishLoadMore()
        }, 1000)
      }
    })
  }
}