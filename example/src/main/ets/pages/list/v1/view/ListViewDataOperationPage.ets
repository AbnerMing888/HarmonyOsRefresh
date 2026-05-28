import { TitleBar } from '@abner/bar'
import { DataController, GridView, ListView } from '@abner/refresh/Index'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/5/10
 * INTRODUCE:普通列表加载数据操作
 * */
@RouterPath("example_ListViewDataOperationPage")
@Component
export struct ListViewDataOperationPage {
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
  itemLayout(item: Object, _: number): void {
    Column() {
      Text("列表数据:" + item)
        .width("100%")
        .height("100%")
        .textAlign(TextAlign.Center)
        .fontColor($r("app.color.tab_select_color"))
        .border({ width: 1, color: $r("app.color.tab_select_color") })
    }
    .width("100%")
    .height(50)
    .justifyContent(FlexAlign.Center)
    .padding({ left: 10, right: 10 })
    .margin({ bottom: 10 })
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
            this.dataController.add(100)
            break;
          case 1: //指定位置增加一个
            this.dataController.addPosition(2, 999)
            break;
          case 2: //指定位置增加多个
            this.dataController.addPositionArray(2, [800, 801, 802])
            break;
          case 3: //数组添加
            this.dataController.addArray([200, 300, 400])
            break;
          case 4: //可变参数形式添加
            this.dataController.addVariable(600, 700)
            break;
          case 5: //删除第一个
            this.dataController.deleteFirst()
            break;
          case 6: //删除最后一个
            this.dataController.deleteLast()
            break;
          case 7: //删除指定一个
            this.dataController.deleteData(2)
            break;
          case 8: //删除全部
            this.dataController.deleteAll()
            break;
          case 9: //修改数据
            this.dataController.changeData(6, 1000)
            break;
        }
      })
  }

  build() {
    Column() {
      TitleBar({ title: "普通的列表数据操作" })
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
      }).height(200)
        .margin({ bottom: 10 })

      ListView({
        items: this.array, //数据源 数组
        dataController: this.dataController,
        itemLayout: (item, index) => this.itemLayout(item, index)
      })
    }
  }
}