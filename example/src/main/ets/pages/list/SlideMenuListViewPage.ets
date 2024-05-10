import { ActionBar } from '../ActionBar'
import { ListView, RefreshDataSource } from '@abner/refresh'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/6
 * INTRODUCE:侧滑右侧展示按钮
 * */

@Entry
@Component
struct SlideMenuListViewPage {
  @State array: Array<number> = []
  private dataSource?: RefreshDataSource

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
      ActionBar({ title: "侧滑右侧展示按钮" })
      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),//条目视图
        slideRightMenuLayout: this.slideRightMenuLayout,//侧滑视图
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