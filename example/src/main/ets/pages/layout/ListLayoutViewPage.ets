import { ActionBar } from '../ActionBar'
import { ListView, RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/6/20
 * INTRODUCE:任意组件之，自己使用列表组件，包含List/Grid/……，重要控制起始位置
 * */

@Entry
@Component
struct LayoutViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: number[] = []
  @State refreshPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  scroller?: Scroller = new Scroller()
  @State listNestedScroll?: NestedScrollOptions = undefined

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

  /*
  * Author:AbnerMing
  * Describe:列表顶部组件,可以是任意的组件
  */
  @Builder
  itemHeaderLayout() {
    Column() {

    }.width("100%")
    .height(100)
    .backgroundColor(Color.Pink)
  }

  @Builder
  itemLayout(_this: LayoutViewPage) {
    //可以是任何的组件
    ListView({
      scroller: _this.scroller,
      items: _this.array, //数据源 数组，可以任意类型，自定义对象[],number[],string[]……
      itemHeaderLayout: _this.itemHeaderLayout,
      itemLayout: _this.listItemLayout, //转成你需要的对象
      listNestedScroll: _this.listNestedScroll,
      onListRefreshPosition: (position) => {
        //获取ListView的位置
        _this.refreshPosition = position
      }
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