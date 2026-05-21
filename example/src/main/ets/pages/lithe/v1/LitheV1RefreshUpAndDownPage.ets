import { LitheRefresh, RefreshController } from '@abner/refresh';
import { TitleBar } from '@abner/bar';
import { RouterPath } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:任意组件下拉上拉
 * */
@RouterPath("example_LitheV1RefreshUpAndDownPage")
@Component
export struct LitheV1RefreshUpAndDownPage {
  controller: RefreshController = new RefreshController()

  @Builder
  itemLayout() {
    Column() {
      Text("任意组件")
        .fontColor(Color.White)
    }.width("100%")
    .height("100%")
    .backgroundColor($r("app.color.tab_select_color"))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      TitleBar({
        title: "任意组件刷新",
        leftText: "返回"
      })

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