import { RefreshController, RefreshLayout } from '@app/refresh'
/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/28
 * INTRODUCE:RefreshLayout使用，支持各种容器或组件
 * */
@Entry
@Component
struct RefreshLayoutPage {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (var i = 0; i < 30; i++) {
      this.array.push(i)
    }
  }

  build() {
    Column() {
      RefreshLayout({
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh() //关闭下拉刷新
        }, onLoadMore: () => {
          //上拉加载
          this.controller.finishLoadMore() //关闭上拉加载
        } }) {
        //可以是任何组件 List/Grid/Column/Row/Text/……

        List() {
          ForEach(this.array, (item, index) => {
            ListItem() {
              Text("测试数据" + index)
                .width("95%")
                .height(50)
                .margin(10)
                .textAlign(TextAlign.Center)
                .border({ width: 1, color: Color.Pink })
            }
          }, item => item)
        }
        .width("100%")
        .height("100%")
        .onScrollIndex((start: number, end: number) => {
          //必须添加，用于控制下拉和上拉何时展示
          this.controller.markLocation(start, end, this.array.length - 1)
        })
        .edgeEffect(EdgeEffect.None)

      }
    }
  }
}