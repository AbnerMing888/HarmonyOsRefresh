import { TitleBar } from '@abner/bar';
import router from '@ohos.router';
import { LitheRefresh, RefreshController } from '@abner/refresh';
import { RouterPath } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:设置沉浸式
 * */
@RouterPath("example_LitheV1RefreshImmersivePage")
@Component
export struct LitheV1RefreshImmersivePage {
  controller: RefreshController = new RefreshController()

  @Builder
  itemLayout() {
    Column() {
      Text("我是任意组件")
        .fontColor($r("app.color.tab_select_color"))
    }.width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Column() {
        TitleBar({
          title: "任意组件刷新",
          barBackgroundColor: Color.White,
          leftText: "返回"
        })
      }.backgroundColor(Color.White)
      .width("100%")
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])


      LitheRefresh({
        itemLayout: this.itemLayout,
        controller: this.controller,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          //加载更多
          setTimeout(() => {
            //模拟耗时
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}