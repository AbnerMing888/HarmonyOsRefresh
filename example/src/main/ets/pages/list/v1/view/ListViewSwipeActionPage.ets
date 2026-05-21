import { TitleBar } from '@abner/bar'
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:系统侧滑按钮  左右都可以 使用懒加载
 * */

@RouterPath("example_ListViewSwipeActionPage")
@Component
export struct ListViewSwipeActionPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  private dataSource?: RefreshDataSource = new RefreshDataSource()
  // private listScroller: ListScroller = new ListScroller() //使用ListScroller来自主关闭

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 40; i++) {
      array.push(i)
    }
    this.dataSource?.initData(array)

    // this.listScroller.closeAllSwipeActions()//手动关闭
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
      TitleBar({ title: "系统侧滑按钮" })
      ListView({
        // scroller:this.listScroller,//手动关闭时需要
        controller: this.controller,
        lazyDataSource: this.dataSource,
        itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
        swipeRightMenuLayout: (index: number) => {
          this.slideRightMenuLayout(index)
        }, //侧滑视图
        swipeLeftMenuLayout: (index: number) => {
          //这里仅用于测试，可以设置不同的视图
          this.slideRightMenuLayout(index)
        }, //侧滑视图
        onRefresh: () => {
          setTimeout(() => {
            //模拟耗时
            this.controller.finishRefresh()
          }, 2000)
        }
      })
    }
  }

  @Builder
  slideRightMenuLayout(index: number) {

    Row() {
      Text("编辑")
        .width(50)
        .height(50)
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)

      Text("删除")
        .width(50)
        .height(50)
        .fontColor(Color.White)
        .backgroundColor(Color.Red)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.dataSource?.deleteData(index)
          this.dataSource?.reloadData()
        })

    }.width(100)
    .height(50)
    .margin({ bottom: 10 })

  }
}