import { RefreshController, RefreshLayoutStatus, FloorStaggeredGridView, RefreshPositionEnum } from '@abner/refresh'


/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/27
 * INTRODUCE:社区视图
 * */

@Component
export struct CommunityView {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  private itemHeightArray: number[] = []
  @State array: Array<number> = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State minSize: number = 80
  @State maxSize: number = 180
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

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.array.push(i)
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  @Builder
  itemLayout(item: Object, index: number): void {
    Column() {
      Text("测试数据" + index)
    }.width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])

  }

  /*
  * Author:AbnerMing
  * Describe:头部组件，可以作为轮播、金刚位等
  */
  @Builder
  itemHeaderLayout(_this: CommunityView) {
    Column() {

    }.width("100%")
    .height(200)
    .backgroundColor(Color.Pink)
    .onClick(() => {
      //未滑动时执行点击
      if (_this.firstScrollDistance == 0) {
        console.log("===============我点击了")
      }
    })
  }

  build() {
    Column() {
      FloorStaggeredGridView({
        items: this.array,
        itemLayout: (item: Object, index: number) => this.itemLayout(item, index),
        controller: this.controller,
        itemHeaderLayout: () => {
          this.itemHeaderLayout(this)
        },
        isParentControlInteraction: false, //是否父类拦截
        enableScrollInteraction: this.enableScrollInteraction,
        reachPosition: (refreshPosition: RefreshPositionEnum) => {
          if (this.onScrollStart != undefined) {
            this.onScrollStart(refreshPosition == RefreshPositionEnum.TOP)
          }
        },
        onScrollIndex: () => {
          console.log("====" + this.controller.getLoadMoreLayoutStatus())
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }.padding({ bottom: 120 }) //动态控制
    .backgroundColor(Color.White)

  }
}