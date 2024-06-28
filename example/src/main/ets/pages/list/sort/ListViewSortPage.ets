import { ListView } from '@abner/refresh';
import { ActionBar } from '../../ActionBar';
import { ListExchangeCtrl } from './model/ListExchangeCtrl';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/6/7
 * INTRODUCE:列表拖拽排序
 * */
@Entry
@Component
export struct ListViewSortPage {
  @State array: number[] = []
  @Provide currentData: number = 0;
  @StorageLink('isLongPress') isLongPress: boolean = false; // 初始化长按状态
  @State listExchangeCtrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>(this.array); // 初始化列表排序管理

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.array.push(i)
    }
    this.listExchangeCtrl = new ListExchangeCtrl<number>(this.array);
  }

  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  itemLayout(_: Object, index: number): void {
    Text("测试数据" + index)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Column() {
      ActionBar({ title: "列表拖拽排序" })
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.array, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .border({ width: 1, color: Color.Pink })
              .margin({ top: 10 })
          }
          .zIndex(this.currentData === item ? 2 : 1) // 层级属性
          .transition(TransitionEffect.OPACITY)
          .attributeModifier(this.listExchangeCtrl.getModifier(item)) //动态设置组件的属性方法， 参数为属性修改器
          .gesture(
            GestureGroup(GestureMode.Sequence,
              // 长按
              LongPressGesture()
                .onAction((event: GestureEvent) => {
                  this.currentData = item;
                  this.isLongPress = true;
                  this.listExchangeCtrl.onLongPress(item);
                }),
              // 拖动
              PanGesture()
                .onActionUpdate((event: GestureEvent) => {
                  this.listExchangeCtrl.onMove(item, event.offsetY);
                })
                .onActionEnd((event: GestureEvent) => {
                  this.listExchangeCtrl.onDrop(item);
                })).onCancel(() => {
              if (!this.isLongPress) {
                return;
              }
              this.listExchangeCtrl.onDrop(item);
            })
          )
        }, (item: string) => item)
      }
    }
  }
}