/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ListInfo } from '../model/ListInfo';
import { MEMO_DATA } from '../model/MockData';
import { ListExchangeCtrl } from '../model/ListExchangeCtrl';

const ITEM_HEIGHT: number = 50; // 列表项高度

/**
 * 首先创建一个数组modifier来添加自定义属性对象，根据组合手势GestureGroup来控制自定义属性的值并通过attributeModifier绑定自定义属性对象来动态加载属性。
 * 然后swipeAction属性绑定删除组件，左滑显示此喊出组件，点击实现列表项的删除。
 */
@Component
export struct ListExchangeView {
  @Provide appInfoList: ListInfo[] = MEMO_DATA; // 列表数据
  @Provide currentData: ListInfo = new ListInfo();
  @State listExchangeCtrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>(this.appInfoList); // 初始化列表排序管理
  @StorageLink('isLongPress') isLongPress: boolean = false; // 初始化长按状态

  /**
   * 删除按钮
   * @param item
   */
  @Builder
  deleteBuilder(item: ListInfo) {
    Image($r("app.media.app_icon"))
      .width(30)
      .height(30)
      .objectFit(ImageFit.Cover)
      .margin({ right: 10 })
      .interpolation(ImageInterpolation.High)// 抗锯齿
      .onClick(() => {
        this.listExchangeCtrl.deleteItem(item);
      })
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text("排序")
          .textAlign(TextAlign.Start)
        Blank()
        Text("简单测试")
      }
      .backgroundColor(Color.White)
      .border({
        radius: {
          topLeft: 10,
          topRight: 10
        }
      })
      .padding({
        left: 10,
        right: 10
      })
      .width('100%')
      .height(50)

      // 列表区域
      List() {
        ForEach(this.appInfoList, (item: ListInfo) => {
          ListItem() {
            DeductionView({ listItemInfo: item })
          }
          .zIndex(this.currentData === item ? 2 : 1) // 层级属性
          .swipeAction({ end: this.deleteBuilder(item) }) // 用于设置ListItem的划出组件
          .transition(TransitionEffect.OPACITY)
          .attributeModifier(this.listExchangeCtrl.getModifier(item)) //动态设置组件的属性方法， 参数为属性修改器
          .gesture(
            // 以下组合手势为顺序识别，当长按手势事件未正常触发时，则不会出发拖动手势事件
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
                })
            ).onCancel(() => {
              if (!this.isLongPress) {
                return;
              }
              this.listExchangeCtrl.onDrop(item);
            })
          )
        }, (item: ListInfo) => JSON.stringify(item))
      }
      .divider({ strokeWidth: '1px', color: 0xeaf0ef })
      .scrollBar(BarState.Off)
      .border({
        radius: {
          bottomLeft: 10,
          bottomRight: 10
        }
      })
      .backgroundColor(Color.White)
      .width('100%')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
    .padding({ left: 10, right: 10 })
  }
}

/**
 * ListItem自定义组件
 */
@Component
struct DeductionView {
  @ObjectLink listItemInfo: ListInfo;
  @Consume appInfoList: ListInfo[];
  @Consume currentData: ListInfo;

  build() {
    Row() {
      Image(this.listItemInfo.icon)
        .width(30)
        .height(30)
        .draggable(false) // TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响Grid子组件拖拽判断，所以修改为false
      Text(this.listItemInfo.name)
        .margin({ left: 10 })
      Blank()
      Image($r("app.media.app_icon"))
        .width(30)
        .height(30)
        .objectFit(ImageFit.Cover)
        .draggable(false) // TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响Grid子组件拖拽判断，所以修改为false
    }
    .width('100%')
    .height(ITEM_HEIGHT)
    .backgroundColor(Color.White)
    .padding({
      left: 10,
      right: 10
    })
  }


}