import { TitleBar } from "@abner/bar"
import { ListLayout, RefreshController, RefreshDataSource } from "@abner/refresh"
import { RouterPath } from "@abner/router"
import { ListItemView } from "../../../../view/ListItemView"

/**
 * AUTHOR:AbnerMing
 * DATE:2026/4/22
 * INTRODUCE:带侧滑按钮的ListView
 * */
@RouterPath("example_ListLayoutSwipeActionPage")
@Component
export struct ListLayoutSwipeActionPage {
  lazyDataSource?: RefreshDataSource = new RefreshDataSource()
  controller: RefreshController = new RefreshController() //刷新控制器
  private listScroller: ListScroller = new ListScroller(); //主动关闭时，需要传递

  aboutToAppear() {
    let array: number[] = []
    for (let i = 0; i < 20; i++) {
      array.push(i)
    }
    this.lazyDataSource?.initData(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "侧滑按钮ListLayout" })
      ListLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: this.itemLayout,
        controller: this.controller,
        scroller: this.listScroller,
        swipeRightMenuLayout: (index: number) => {
          this.swipeMenuLayout(index)
        }, //侧滑视图
        swipeLeftMenuLayout: (index: number) => {
          //这里仅用于测试，可以设置不同的视图
          this.swipeMenuLayout(index)
        }, //侧滑视图
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //下拉刷新
          setTimeout(() => {
            //模拟耗时
            let array: number[] = []
            for (let i = 0; i < 5; i++) {
              array.push(i)
            }
            this.lazyDataSource?.pushDataArray(array)
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }.width("100%")
    .height("100%")
  }

  @Builder
  swipeMenuLayout(index: number) {
    Row() {
      Text("关闭")
        .width(50)
        .height(50)
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          //主动关闭
          this.listScroller.closeAllSwipeActions()
        })

      Text("删除")
        .width(50)
        .height(50)
        .fontColor(Color.White)
        .backgroundColor(Color.Red)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.lazyDataSource?.deleteData(index)
          this.lazyDataSource?.reloadData() //重置索引
        })

    }.width(100)
    .height(50)
    .margin({ bottom: 10 })
  }
}