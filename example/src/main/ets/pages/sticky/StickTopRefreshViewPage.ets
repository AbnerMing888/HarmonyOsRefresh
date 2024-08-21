import { ListView, RefreshController, RefreshLayout, RefreshPositionEnum } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/30
 * INTRODUCE:任意组件之，顶部下拉刷新，上拉顶部不动
 * */

@Entry
@Component
struct StickTopRefreshViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = []
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.TOP
  @State listNestedScroll?: NestedScrollOptions = {
    scrollForward: NestedScrollMode.SELF_FIRST,
    scrollBackward: NestedScrollMode.SELF_FIRST
  }
  @State enableScrollInteraction: boolean = true

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr1.push(i)
    }
  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  itemLayout(_this: StickTopRefreshViewPage) {

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

  build() {
    Column() {
      RefreshLayout({
        itemLayout: () => {
          this.itemLayout(this)
        },
        controller: this.controller,
        refreshPosition: this.listPosition, //定位位置
        isRefreshTopSticky: false, //是否顶部吸顶
        enableScrollInteraction: (isInteraction) => {
          this.enableScrollInteraction = isInteraction
        },
        onStickyNestedScroll: (nestedScroll: NestedScrollOptions) => {
          //this.listNestedScroll = nestedScroll
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
