import { TitleBar } from '@abner/bar';
import { RefreshDataSource, WaterFlowLayout } from '@abner/refresh';
import { RouterPath } from '@abner/router';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:自适应高度，顶部
 * */

@RouterPath("example_FlowLayoutAdaptiveBottomPage")
@Component
export struct FlowLayoutAdaptiveBottomPage {
  lazyDataSource: RefreshDataSource = new RefreshDataSource()
  private itemHeightArray: number[] = []
  @State colors: ResourceColor[] = ["#ee6d82", "#e5682f","#eeb272","#cbb41b","#d86fea","#5f97ea"]
  @State minSize: number = 80
  @State maxSize: number = 180

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  aboutToAppear() {
    let array: Array<number> = []
    for (let i = 0; i < 50; i++) {
      array.push(i)
      this.itemHeightArray.push(this.getSize())
    }
    this.lazyDataSource.pushDataArray(array)
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    Column() {
      Text("列表数据:" + index)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height(this.itemHeightArray[index % 100])
    .backgroundColor(this.colors[index % 5])
  }

  build() {
    Column() {
      TitleBar({ title: "自适应高度底部(WaterFlowLayout)" })
      WaterFlowLayout({
        lazyDataSource: this.lazyDataSource,
        itemLayout: (item: Object, index: number) => this.itemLayout(item, index),
        lazyCachedCount: 10, //缓存
        edgeEffect: EdgeEffect.Spring//开启阻尼
      })
      Text("我是底部的视图")
        .width("100%")
        .height(100)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .backgroundColor($r("app.color.tab_select_color"))
    }
  }
}
