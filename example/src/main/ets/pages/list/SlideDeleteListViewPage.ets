import { ActionBar } from '../ActionBar'
import { ListView, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/6
 * INTRODUCE:侧滑右侧展示按钮
 * */

@Entry
@Component
struct SlideDeleteListViewPage {
  private mRefreshDataSource: RefreshDataSource = new RefreshDataSource()

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 40; i++) {
      array.push(i)
    }

    this.mRefreshDataSource.initData(array)
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
      ActionBar({ title: "侧滑直接删除" })
      ListView({
        lazyDataSource: this.mRefreshDataSource,
        isSwipeDelete: true,
        itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
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