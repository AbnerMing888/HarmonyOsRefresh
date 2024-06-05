import { ActionBar } from '../ActionBar'
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/24
 * INTRODUCE:侧滑展示按钮
 * */

@Entry
@Component
struct SwipeActionListViewPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  private dataSource?: RefreshDataSource
  @State isSwipeDelete: boolean = false
  @State enableRefresh: boolean = false

  aboutToAppear() {
    for (let i = 0; i < 40; i++) {
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
  itemLayout(item: Object, index: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "侧滑右侧展示按钮" }).onClick(() => {
        this.enableRefresh = !this.enableRefresh
      })
      ListView({
        items: this.array, //数据源 数组
        controller: this.controller,
        itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
        swipeRightMenuLayout: this.slideRightMenuLayout, //侧滑视图
        swipeLeftMenuLayout: this.slideRightMenuLayout, //侧滑视图
        isSwipeDelete: this.isSwipeDelete,
        enableRefresh: this.enableRefresh,
        onRefresh: () => {
          this.controller.finishRefresh()
        },
        slideMenuAttr: (attr) => {
          //设置侧滑属性
          attr.rightMenuWidth = 100
        },
        onLazyDataSource: (dataSource: RefreshDataSource) => {
          this.dataSource = dataSource
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
    }.width(100)
    .height(50)

  }
}