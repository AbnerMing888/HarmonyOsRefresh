import { ListView, RefreshController } from '@abner/refresh/Index'
import { ActionBar } from '../ActionBar'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/23
 * INTRODUCE:错误或空的缺省页
 * */

@Entry
@Component
struct ErrorOrEmptyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  @State showEmptyLayout: boolean = false
  @State showErrorLayout: boolean = false
  @State showLoadingLayout: boolean = false

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
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
  itemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  /*
  * Author:AbnerMing
  * Describe:空布局
  */
  @Builder
  emptyLayout() {
    Column() {
      Text("我是一个空布局")
    }.width("100%")
    .height("100%")
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }

  /*
  * Author:AbnerMing
  * Describe:错误布局
  */
  @Builder
  errorLayout() {
    Column() {
      Text("我是一个错误布局")
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }

  /*
* Author:AbnerMing
* Describe:错误布局
*/
  @Builder
  loadingLayout() {
    Column() {
      Text("我是一个Loading布局")
        .width(200)
        .height(200)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)

    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      ActionBar({ title: "缺省页设置" })
      Row() {
        Button("空布局")
          .onClick(() => {
            this.showEmptyLayout = !this.showEmptyLayout
          })
        Button("错误布局")
          .onClick(() => {
            this.showErrorLayout = !this.showErrorLayout
          })
        Button("加载布局")
          .onClick(() => {
            this.showLoadingLayout = !this.showLoadingLayout
          })
      }

      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        emptyLayout: this.emptyLayout, //空布局
        errorLayout: this.errorLayout, //错误布局
        loadingLayout: this.loadingLayout, //loading布局
        showEmptyLayout: this.showEmptyLayout, //控制空布局展示
        showErrorLayout: this.showErrorLayout, //控制错误布局展示
        showLoadingLayout: this.showLoadingLayout, //控制loadingLayout
        controller: this.controller, //控制器，负责关闭下拉和上拉
        isLazyData: false,
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            //模拟耗时
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}