import { ActionBar } from '../ActionBar'
import { RefreshController, RefreshLayout } from '@abner/refresh'
import webview from '@ohos.web.webview';

/**
 * AUTHOR:AbnerMing
 * DATE:2025/5/16
 * INTRODUCE:Web组件
 * */

@Entry
@Component
struct WebViewPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State isWebTop: boolean = true //判断web是否到达了顶端

  @Builder
  itemLayout() {
    //可以是任何的组件
    Web({ src: "https://juejin.cn/user/1398234520239095/columns", controller: this.webviewController })
      .width("100%")
      .nestedScroll({
        scrollForward: NestedScrollMode.SELF_FIRST,
        scrollBackward: NestedScrollMode.PARENT_FIRST
      })
      .onScroll((event) => {
        this.isWebTop = event.yOffset == 0 //判断web是否滑动到顶部
      })
      .onPageEnd(() => {
        //默认不可滑动
        this.webviewController.setScrollable(false)
      })
  }

  build() {
    Column() {
      ActionBar({ title: "Web组件" })

      RefreshLayout({
        itemLayout: () => {
          this.itemLayout()
        },
        controller: this.controller,
        isWebTop: this.isWebTop,
        onScrollDirection: (isDown: boolean) => {
          if (this.isWebTop) {
            //在顶部，需要判断手势是往下还是往上
            this.webviewController.setScrollable(!isDown)
          } else {
            //不在顶部，一律可滑动
            this.webviewController.setScrollable(true)
          }
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