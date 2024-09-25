import { ActionBar } from '../ActionBar'
import { RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/6/20
 * INTRODUCE:任意组件之，自己使用列表组件，包含List/Grid/……，重要控制起始位置
 * */

@Entry
@Component
struct SystemListViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: number[] = []
  @State refreshPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  scroller?: Scroller = new Scroller()
  @State listNestedScroll?: NestedScrollOptions  = {
  scrollForward: NestedScrollMode.SELF_FIRST,
  scrollBackward: NestedScrollMode.PARENT_FIRST
}

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.array.push(i)
    }
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  listItemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  @Builder
  itemLayout(_this: SystemListViewPage) {
    //可以是任何的组件
    List({ scroller: _this.scroller }) {
      ForEach(_this.array, (item: number) => {
        ListItem() {
          Text("测试数据" + item)
            .width("95%")
            .height(50)
            .margin(10)
            .textAlign(TextAlign.Center)
            .border({ width: 1, color: Color.Pink })
        }
      }, (item: string) => item)

    }
    .scrollBar(BarState.Off)
    .nestedScroll(_this.listNestedScroll)
    .onReachStart(() => {
      _this.refreshPosition = RefreshPositionEnum.TOP
    })
    .onReachEnd(() => {
      _this.refreshPosition = RefreshPositionEnum.BOTTOM
    })
    .onScrollFrameBegin((offset: number) => {
      if ((_this.refreshPosition == RefreshPositionEnum.TOP && offset <= 0) || (
        _this.refreshPosition == RefreshPositionEnum.BOTTOM && offset >= 0
      )) {
        _this.scroller!.scrollBy(0, offset)
        return { offsetRemain: 0 }
      }
      _this.refreshPosition = RefreshPositionEnum.CENTER
      return { offsetRemain: offset }
    })

  }

  build() {
    Column() {
      ActionBar({ title: "任意多组件嵌套" })
      RefreshLayout({
        itemLayout: () => {
          this.itemLayout(this)
        },
        controller: this.controller,
        refreshPosition: this.refreshPosition, //定位位置
        childScroller: this.scroller,
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