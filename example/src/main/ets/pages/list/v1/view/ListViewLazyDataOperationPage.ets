import { TitleBar } from '@abner/bar'
import { GridView, ListView, RefreshDataSource } from '@abner/refresh/Index'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/10
 * INTRODUCE:懒加载数据列表操作
 * */

@RouterPath("example_ListViewLazyDataOperationPage")
@Component
export struct ListViewLazyDataOperationPage {
  dataSource: RefreshDataSource = new RefreshDataSource() //数据懒加载操作对象，执行数据增删改查
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.array.push(i)
    }
    this.dataSource.initData(this.array)
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

  @Builder
  gridViewItemLayout(item: Object, index: number): void {
    Text(item.toString())
      .textAlign(TextAlign.Center)
      .height(40)
      .width("100%")
      .fontSize(13)
      .fontColor($r("app.color.tab_select_color"))
      .border({ width: 1, color: $r("app.color.tab_select_color"), radius: 5 })
      .onClick(() => {
        switch (index) {
          case 0: //增加一个
            this.dataSource.pushData(100)
            break;
          case 1: //指定位置增加一个
            this.dataSource.pushDataPosition(2, 200)
            break;
          case 2: //指定位置增加多个
            this.dataSource.pushDataPositionArray(2, [300, 301])
            break;
          case 3: //数组添加
            this.dataSource.pushDataArray([300, 301, 302])
            break;
          case 4: //可变参数形式添加
            this.dataSource.pushDataVariable(400, 401, 402)
            break;
          case 5: //删除第一个
            this.dataSource.deleteFirst()
            break;
          case 6: //删除最后一个
            this.dataSource.deleteLast()
            break;
          case 7: //删除指定一个
            this.dataSource.deleteData(0)
            break;
          case 8: //删除全部
            this.dataSource.deleteAll()
            break;
          case 9: //修改数据
            this.dataSource.changeData(3, 9999)
            break;
        }
      })
  }

  build() {
    Column() {
      TitleBar({ title: "懒加载数据列表操作" })
      GridView({
        items: ["增加一个", "指定位置增加一个", "指定位置增加多个", "数组添加", "可变参数添加", "删除第一个",
          "删除最后一个",
          "删除指定一个", "删除全部",
          "修改数据"],
        itemLayout: (item: Object, index: number) => {
          this.gridViewItemLayout(item, index)
        },
        gridAttribute: (attr) => {
          attr.columnsTemplate = "1fr 1fr 1fr"
          attr.columnsGap = 10
          attr.rowsGap = 10
          attr.padding = { left: 10, right: 10 }
        }
      }).height(150)
        .margin({ bottom: 10 })

      ListView({
        lazyDataSource: this.dataSource,
        itemLayout: (item, index) => this.itemLayout(item, index),
      })
    }
  }
}