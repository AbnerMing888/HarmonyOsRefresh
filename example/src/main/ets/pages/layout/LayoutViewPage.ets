import { ActionBar } from '../ActionBar'
import { RefreshController, RefreshLayout } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:任意组件
 * */

@Entry
@Component
struct LayoutViewPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器

  @Builder
  itemLayout() {
    //可以是任何的组件
    Column() {
      Text("我是测试数据")
    }.width("100%")
    .height("100%")
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      ActionBar({ title: "任意组件" })
      RefreshLayout({
        controller: this.controller,
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
        },
        itemLayout: this.itemLayout
      })
    }
  }
}