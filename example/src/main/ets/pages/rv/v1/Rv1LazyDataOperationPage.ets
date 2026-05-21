import { RefreshDataSource } from '@abner/refresh'
import { TitleBar } from '@abner/bar'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2024/11/13
 * INTRODUCE:懒加载数据使用，主要封装了增删改查
 * */
@RouterPath("example_Rv1LazyDataOperationPage")
@Component
export struct Rv1LazyDataOperationPage {
  dataSource: RefreshDataSource = new RefreshDataSource() //数据懒加载操作对象，执行数据增删改查
  private mList: string[] =
    ["增加一个", "指定位置增加一个", "指定位置增加多个", "数组添加", "可变参数添加", "删除第一个",
      "删除最后一个",
      "删除指定一个", "删除全部",
      "修改数据"]

  aboutToAppear(): void {
    this.dataSource.initData([0, 1, 2, 3, 4, 5, 6])
  }

  @Builder
  gridViewItemLayout(item: Object, index: number): void {
    Text(item.toString())
      .width("100%")
      .height(40)
      .textAlign(TextAlign.Center)
      .border({ color: $r("app.color.tab_select_color"), width: 1 })
      .borderRadius(5)
      .fontColor($r("app.color.tab_select_color"))
      .fontSize(13)
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

      TitleBar({
        title: "【懒加载数据使用】"
      })


      Grid() {
        ForEach(this.mList, (item: string, index: number) => {
          GridItem() {
            this.gridViewItemLayout(item, index)
          }
        })
      }
      .columnsTemplate("1fr 1fr 1fr")
      .height(220)
      .columnsGap(10)
      .rowsGap(10)
      .padding({ left: 10, right: 10 })

      List() {
        LazyForEach(this.dataSource, (_: number, index: number) => {
          ListItem() {
            ListItemView({ index: index })
          }
        }, (item: string, index: number) => JSON.stringify(item) + "_" + index)
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)
      .width("100%")
      .layoutWeight(1)
      .padding({ left: 10, right: 10 })
    }
  }
}