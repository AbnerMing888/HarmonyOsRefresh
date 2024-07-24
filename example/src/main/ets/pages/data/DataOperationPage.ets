import { DataController, GridView, ListView } from '@abner/refresh/Index'
import { ActionBar } from '../ActionBar'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/10
 * INTRODUCE:普通列表加载数据操作
 * */
@Entry
@Component
struct DataOperationPage {
  dataController: DataController = new DataController() //数据控制器
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
  itemLayout(item: Object, index: number): void {
    Text("测试数据" + item)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
      .onClick(() => {
        console.log("当前索引：" + index)
      })
  }

  @Builder
  gridViewItemLayout(_this: DataOperationPage, item: Object, index: number): void {
    Button(item.toString())
      .margin({ top: 10 })
      .onClick(() => {
        switch (index) {
          case 0: //增加一个
            _this.dataController.add(100)
            break;
          case 1: //指定位置增加一个
            _this.dataController.addPosition(2, 999)
            break;
          case 2: //指定位置增加多个
            _this.dataController.addPositionArray(2, [800, 801, 802])
            break;
          case 3: //数组添加
            _this.dataController.addArray([200, 300, 400])
            break;
          case 4: //可变参数形式添加
            _this.dataController.addVariable(600, 700)
            break;
          case 5: //删除第一个
            _this.dataController.deleteFirst()
            break;
          case 6: //删除最后一个
            _this.dataController.deleteLast()
            break;
          case 7: //删除指定一个
            _this.dataController.deleteData(2)
            break;
          case 8: //删除全部
            _this.dataController.deleteAll()
            break;
          case 9: //修改数据
            _this.dataController.changeData(6, 1000)
            break;
        }
      })
  }

  build() {
    Column() {
      ActionBar({ title: "普通的列表数据操作" })
      GridView({
        items: ["增加一个", "指定位置增加一个", "指定位置增加多个", "数组添加", "可变参数添加", "删除第一个",
          "删除最后一个",
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
        dataController: this.dataController,
        isLazyData: false, //标记为普通加载，也就是使用ForEach
        itemLayout: (item, index) => this.itemLayout(item, index)
      }).padding({ bottom: 150 })
    }
  }
}