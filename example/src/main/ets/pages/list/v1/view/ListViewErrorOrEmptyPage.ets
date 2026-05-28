import { TitleBar } from '@abner/bar'
import { ListView, RefreshController } from '@abner/refresh/Index'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/23
 * INTRODUCE:错误或空的缺省页
 * */
@RouterPath("example_ListViewErrorOrEmptyPage")
@Component
export struct ListViewErrorOrEmptyPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  @State showEmptyLayout: boolean = false
  @State showErrorLayout: boolean = false
  @State showLoadingLayout: boolean = false

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
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
    ListItemView({
      index: index
    })
  }

  /*
  * Author:AbnerMing
  * Describe:空布局
  */
  @Builder
  emptyLayout() {
    Column() {
      Text("我是一个空布局")
        .fontColor(Color.White)
    }.width("100%")
    .height("100%")
    .backgroundColor($r("app.color.tab_select_color"))
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
        .fontColor(Color.White)
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.tab_select_color"))
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
        .fontColor(Color.White)
        .backgroundColor($r("app.color.tab_select_color"))

    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      TitleBar({ title: "缺省页设置" })
      Row() {
        Button("空布局")
          .backgroundColor($r("app.color.tab_select_color"))
          .borderRadius(10)
          .fontSize(14)
          .onClick(() => {
            this.showErrorLayout = false
            this.showLoadingLayout = false
            this.showEmptyLayout = !this.showEmptyLayout
          })
        Button("错误布局")
          .borderRadius(10)
          .margin({ left: 10 })
          .fontSize(14)
          .backgroundColor($r("app.color.tab_select_color"))
          .onClick(() => {
            this.showEmptyLayout = false
            this.showLoadingLayout = false
            this.showErrorLayout = !this.showErrorLayout
          })
        Button("加载布局")
          .borderRadius(10)
          .margin({ left: 10 })
          .fontSize(14)
          .backgroundColor($r("app.color.tab_select_color"))
          .onClick(() => {
            this.showEmptyLayout = false
            this.showErrorLayout = false
            this.showLoadingLayout = !this.showLoadingLayout
          })
      }.margin({ bottom: 10 })

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