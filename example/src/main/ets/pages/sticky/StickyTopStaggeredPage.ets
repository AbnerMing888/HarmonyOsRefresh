import { RefreshController, StaggeredGridView } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/14
 * INTRODUCE:吸顶页面-瀑布流方式
 * */

@Entry
@Component
struct StickyTopStaggeredPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  @State listPosition: number = 0
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
  itemLayout(_this: StickyTopStaggeredPage, _: Object, index: number) {
    Column() {
      Text("测试数据" + index)
    }.width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
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
    StaggeredGridView({
      items: arr,
      itemLayout: (item: Object, index: number) => {
        this.itemLayout(this, item, index)
      },
      controller: this.controller,
      onRefresh: () => {
        //下拉刷新
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
      nestedScroll: {
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      }
    })
  }
}