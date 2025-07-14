import { RefreshController, RefreshLayout, RefreshPositionEnum, WaterFlowView } from '@abner/refresh'
import window from '@ohos.window'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/14
 * INTRODUCE:吸顶页面-瀑布流方式-固定ActionBar
 * */


@Entry
@Component
struct StickTopWaterPage {
  @State listPosition: RefreshPositionEnum = RefreshPositionEnum.BOTTOM
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  controller: RefreshController = new RefreshController() //刷新控制器
  @State enableScrollInteraction: boolean = true
  @State listNestedScroll?: NestedScrollOptions = {
    scrollForward: NestedScrollMode.PARENT_FIRST,
    scrollBackward: NestedScrollMode.SELF_FIRST
  }
  @State navHeight: number = 0

  aboutToAppear(): void {
    window.getLastWindow(getContext(), (_, win) => {
      const avoidAreaType = window.AvoidAreaType.TYPE_SYSTEM
      const avoidArea = win.getWindowAvoidArea(avoidAreaType)
      const height = avoidArea.topRect.height
      this.navHeight = px2vp(height)
    })
  }

  @Builder
  tabBuilder(index: number, name: string, _this: StickTopWaterPage) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  @Builder
  childView() {
    Stack() {
      Scroll() {
        Column() {

          Text("头View")
            .fontColor(Color.White)
            .width("100%")
            .height(250)
            .backgroundColor(Color.Red)
            .textAlign(TextAlign.Center)
            .margin({ top: -(50+this.navHeight) })

          Tabs({ barPosition: BarPosition.Start }) {
            TabContent() {
              this.testLayout(0)
            }.tabBar(this.tabBuilder(0, "Tab1", this))

            TabContent() {
              this.testLayout(1)
            }.tabBar(this.tabBuilder(1, "Tab2", this))
          }
          .barHeight(50)
          .vertical(false)
          .height("100%")
          .onChange((index: number) => {
            this.currentIndex = index
          })
        }.width("100%")
      }
      .padding({ top: 50 + this.navHeight })
      .scrollBar(BarState.Off)
      .width('100%')
      .height('100%')
      .nestedScroll(this.listNestedScroll)
      //下拉刷新相关
      .onReachStart(() => {
        this.listPosition = RefreshPositionEnum.TOP
      })

      // .onScrollFrameBegin((offset: number, _: ScrollState) => {
      //   if ((this.listPosition == RefreshPositionEnum.TOP && offset <= 0) ||
      //     (this.listPosition == RefreshPositionEnum.BOTTOM && offset >= 0)
      //   ) {
      //     return { offsetRemain: 0 }
      //   }
      //   //不在底部
      //   this.listPosition = RefreshPositionEnum.CENTER
      //   return { offsetRemain: offset }
      // })

      Column() {
        Blank()
          .height(this.navHeight)
        Text("顶部标题栏")
      }
      .backgroundColor(Color.Transparent)
      .width("100%")
      .height(50 + this.navHeight)
      .justifyContent(FlexAlign.Center)

    }.alignContent(Alignment.TopStart)
  }

  build() {

    Column() {

      RefreshLayout({
        itemLayout: () => {
          this.childView()
        },
        controller: this.controller,
        refreshPosition: this.listPosition, //定位位置
        isRefreshTopSticky: true, //是否顶部吸顶
        isRefreshTopTitleSticky: true,
        enableScrollInteraction: (interaction: boolean) => {
          this.enableScrollInteraction = interaction
        },
        onStickyNestedScroll: (nestedScroll: NestedScrollOptions) => {
          this.listNestedScroll = nestedScroll
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
        .margin({ top: -this.navHeight })
    }
    .width("100%")
    .height("100%")

  }

  /*
  * Author:AbnerMing
  * Describe:这里仅仅是测试，实际应以业务需求为主，可以是任意得组件视图
  */
  @Builder
  testLayout(type: number) {
    StickyStaggeredView({
      pageType: type,
      nestedScroll: this.listNestedScroll,
      enableScrollInteraction: this.enableScrollInteraction,
      onRefreshPosition: (refreshPosition: RefreshPositionEnum) => {
        if (refreshPosition != RefreshPositionEnum.TOP) {
          this.listPosition = refreshPosition
        }
      }
    })
  }
}

/*
* Author:AbnerMing
* Describe:瀑布流页面
*/
@Component
struct StickyStaggeredView {
  @State pageType: number = 0
  controller: RefreshController = new RefreshController() //刷新控制器
  @State arr1: number[] = [] //实际情况当以tab指示器对应得数据为主，这里仅仅是测试
  @State arr2: number[] = []
  private itemHeightArray: number[] = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State minSize: number = 80
  @State maxSize: number = 180
  @Prop nestedScroll: NestedScrollOptions = {
    scrollForward: NestedScrollMode.SELF_FIRST,
    scrollBackward: NestedScrollMode.PARENT_FIRST
  }
  onRefreshPosition?: (refreshPosition: RefreshPositionEnum) => void //回调位置
  @Prop enableScrollInteraction: boolean = true; //拦截列表

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
    WaterFlowView({
      items: this.pageType == 0 ? this.arr1 : this.arr2,
      itemView: (item: Object, index: number) => {
        this.itemLayout(this, item, index)
      },
      nestedScroll: this.nestedScroll,
      onRefreshPosition: this.onRefreshPosition,
      enableScrollInteraction: this.enableScrollInteraction,
    })
  }
}