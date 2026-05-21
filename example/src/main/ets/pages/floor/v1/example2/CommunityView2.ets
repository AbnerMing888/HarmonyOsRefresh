import {
  RefreshController, RefreshLayoutStatus, RefreshPositionEnum, FloorListView
} from '@abner/refresh'
import { ListItemView } from '../../../../view/ListItemView'
import display from '@ohos.display'


/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:社区视图
 * */

@Component
export struct CommunityView2 {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  scroller: Scroller = new Scroller()
  onScrollStart?: (isRefreshStart: boolean) => void
  @State enableScrollInteraction?: boolean = true
  @Prop refreshLayoutStatus?: RefreshLayoutStatus = RefreshLayoutStatus.Pulling //当前的刷新状态
  @Prop @Watch("firstScrollListener") firstScrollDistance?: number = 0 //一楼滑动距离

  /*
  * Author:AbnerMing
  * Describe:一楼滑动监听
  */
  firstScrollListener() {
    this.enableScrollInteraction = this.firstScrollDistance! < 1

  }

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.array.push(i)
    }
  }

  @Builder
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  /*
  * Author:AbnerMing
  * Describe:头部组件，可以作为轮播、金刚位等
  */
  @Builder
  itemHeaderLayout(_this: CommunityView2) {
    Column() {

    }
    .width("100%")
    .height(200)
    .backgroundColor($r("app.color.tab_select_color"))
    .margin({ bottom: 10 })
    .onClick(() => {
      //未滑动时执行点击
      if (_this.firstScrollDistance == 0) {
        console.log("===============我点击了")
      }
    })
  }

  build() {
    FloorListView({
      items: this.array,
      controller: this.controller,
      itemHeaderLayout: () => {
        this.itemHeaderLayout(this)
      },
      itemLayout: (item: Object, index: number) => this.itemLayout(item, index),
      enableScrollInteraction: this.enableScrollInteraction,
      reachPosition: (refreshPosition: RefreshPositionEnum) => {
        if (this.onScrollStart != undefined) {
          this.onScrollStart(refreshPosition == RefreshPositionEnum.TOP)
        }
      },
      onLoadMore: () => {
        //上拉加载
        setTimeout(() => {
          this.controller.finishLoadMoreFixedBottom(true)
        }, 3000)
      }
    }).backgroundColor(Color.White)
  }
}