import { GridView, ListView, RefreshDataSource } from '@abner/refresh/Index'
import { ActionBar } from '../ActionBar'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/10
 * INTRODUCE:懒加载数据列表操作
 * */

@Entry
@Component
struct LazyDataOperationPage {
  @State dataSource: RefreshDataSource = new RefreshDataSource() //数据懒加载操作对象，执行数据增删改查
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
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
  itemLayout(item: Object, _: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  @Builder
  gridViewItemLayout(_this: LazyDataOperationPage, item: Object, index: number): void {
    Button(item.toString())
      .margin({ top: 10 })
      .onClick(() => {
        switch (index) {
          case 0: //增加一个
            _this.dataSource.pushData(100)
            break;
          case 1: //指定位置增加一个
            _this.dataSource.pushDataPosition(2, 200)
            break;
          case 2: //数组添加
            _this.dataSource.pushDataArray([300, 301, 302])
            break;
          case 3: //可变参数形式添加
            _this.dataSource.pushDataVariable(400, 401, 402)
            break;
          case 4: //删除第一个
            _this.dataSource.deleteFirst()
            break;
          case 5: //删除最后一个
            _this.dataSource.deleteLast()
            break;
          case 6: //删除指定一个
            _this.dataSource.deleteData(2)
            break;
          case 7: //删除全部
            _this.dataSource.deleteAll()
            break;
          case 8: //修改数据
            _this.dataSource.changeData(3, 9999)
            break;
        }
      })
  }

  build() {
    Column() {
      ActionBar({ title: "懒加载数据列表操作" })
      GridView({
        items: ["增加一个", "指定位置增加一个", "数组添加", "可变参数添加", "删除第一个", "删除最后一个",
          "删除指定一个", "删除全部",
          "修改数据"],
        itemLayout: (item: Object, index: number) => {
          this.gridViewItemLayout(this, item, index)
        },
        gridAttribute: (attr) => {
          attr.columnsTemplate = "1fr 1fr 1fr"
        }
      }).height(150)

      ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),
        onLazyDataSource: (dataSource: RefreshDataSource) => {
          //必须实现此属性，用RefreshDataSource进行数据的操作
          this.dataSource = dataSource
        }
      }).padding({ bottom: 150 })
    }
  }
}