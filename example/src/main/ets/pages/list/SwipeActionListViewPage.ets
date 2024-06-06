import { ActionBar } from '../ActionBar'
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:系统侧滑按钮  左右都可以 使用懒加载
 * */

@Entry
@Component
struct SwipeActionListViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  private dataSource?: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 40; i++) {
      array.push(i)
    }
    this.dataSource?.initData(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(item: Object, _: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "系统侧滑按钮" })
      ListView({
        controller: this.controller,
        lazyDataSource: this.dataSource,
        itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
        swipeRightMenuLayout: (index: number) => {
          this.slideRightMenuLayout(this, index)
        }, //侧滑视图
        swipeLeftMenuLayout: (index: number) => {
          this.slideRightMenuLayout(this, index)
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
  slideRightMenuLayout(_this: SwipeActionListViewPage, index: number) {

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
          _this.dataSource?.deleteData(index)
          _this.dataSource?.reloadData()

        })

    }.width(100)
    .height(50)

  }
}