import { BarMenuType, TitleBar } from '@abner/bar';
import { RefreshController, RefreshView } from '@abner/refresh';
import { RouterPath } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:设置沉浸式
 * */
@RouterPath("example_Rv1RefreshImmersivePage")
@Component
export struct Rv1RefreshImmersivePage {
  controller: RefreshController = new RefreshController()

  @Builder
  itemLayout() {
    Column() {
      Text("我是任意组件")
        .fontColor(Color.White)
    }.width("100%")
    .height("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Column() {
        TitleBar({
          title: "【沉浸式】",
          onTitleAttribute: (attr) => {
            attr.fontColor = Color.White
          },
          leftText: "返回",
          leftMenuType: BarMenuType.DEFAULT,
          onLeftMenuAttribute: (attr) => {
            attr.fontColor = Color.White
          }
        })
      }.backgroundColor($r("app.color.tab_select_color"))
      .width("100%")
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])


      RefreshView({
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