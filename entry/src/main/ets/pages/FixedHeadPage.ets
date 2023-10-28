import { ListView, RefreshController } from "@app/refresh"

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/28
 * INTRODUCE:固定头部刷新
 * */
@Entry
@Component
struct FixedHeadPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (var i = 0; i < 30; i++) {
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
  itemLayout(item, index) {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Stack() {
      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        marginHeader: 80,
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh()
        },
        onLoadMore: () => {
          //上拉加载
          this.controller.finishLoadMore()
        }
      })


      Row() {
        Text("我是标题")
      }.width("100%")
      .height(80)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Pink)

    }.alignContent(Alignment.Top)
  }
}