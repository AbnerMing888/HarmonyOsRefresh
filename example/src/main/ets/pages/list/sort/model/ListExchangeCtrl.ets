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

import { ListItemModifier } from '../model/AttributeModifier';
import curves from '@ohos.curves';

const ITEM_HEIGHT: number = 50; // 行高
const ANIMATE_DURATION: number = 300; // 动画时间

// 操作状态枚举
enum OperationStatus {
  IDLE,
  PRESSING,
  MOVING,
  DROPPING,
  DELETE
}

/**
 * 列表项切换控制
 */
@Observed
export class ListExchangeCtrl<T> {
  private deductionData: Array<T>; // 列表数据
  private modifier: Array<ListItemModifier>; // 属性数据
  private dragRefOffset: number = 0;
  offsetY: number = 0;
  state: OperationStatus = OperationStatus.IDLE;

  constructor(deductionData: Array<T>) {
    this.deductionData = deductionData;
    this.modifier = new Array<ListItemModifier>();
    deductionData.forEach(() => {
      this.modifier.push(new ListItemModifier());
    })
  }

  /**
   * 获取ListItem的属性
   * @param item
   * @returns 返回自定义属性对象
   */
  getModifier(item: T): ListItemModifier {
    const index: number = this.deductionData.indexOf(item);
    return this.modifier[index];
  }

  /**
   * ListItem长按函数
   * @param item
   */
  onLongPress(item: T): void {
    const index: number = this.deductionData.indexOf(item);
    this.dragRefOffset = 0;
    // TODO:知识点:长按当前列表项透明度和放大动画
    animateTo({ curve: Curve.Friction, duration: ANIMATE_DURATION }, () => {
      this.state = OperationStatus.PRESSING;
      this.modifier[index].hasShadow = true;
      this.modifier[index].scale = 1.04; // 放大比例为1.04
    })
  }

  /**
   * ListItem移动函数
   * @param item
   * @param offsetY
   */
  onMove(item: T, offsetY: number): void {
    const index: number = this.deductionData.indexOf(item);
    this.offsetY = offsetY - this.dragRefOffset;
    this.modifier[index].offsetY = this.offsetY;
    const direction: number = this.offsetY > 0 ? 1 : -1;
    // 触发拖动时，被覆盖子组件缩小与恢复的动画
    const curveValue: ICurve = curves.initCurve(Curve.Sharp);
    const value: number = curveValue.interpolate(Math.abs(this.offsetY) / ITEM_HEIGHT);
    const shrinkScale: number = 1 - value / 10; // 计算缩放比例，value值缩小10倍
    if (index < this.modifier.length - 1) { // 当拖拽的时候，被交换的对象会缩放
      this.modifier[index + 1].scale = direction > 0 ? shrinkScale : 1;
    }
    if (index > 0) {
      this.modifier[index - 1].scale = direction > 0 ? 1 : shrinkScale;
    }
    // TODO:知识点:处理列表项的切换操作
    if (Math.abs(this.offsetY) > ITEM_HEIGHT / 2) {
      animateTo({ curve: Curve.Friction, duration: ANIMATE_DURATION }, () => {
        this.offsetY -= direction * ITEM_HEIGHT;
        this.dragRefOffset += direction * ITEM_HEIGHT;
        this.modifier[index].offsetY = this.offsetY;
        this.changeItem(index, index + direction);
      })
    }
  }

  /**
   * ListItem放置函数
   * @param item
   */
  onDrop(item: T): void {
    const index: number = this.deductionData.indexOf(item);
    this.dragRefOffset = 0;
    this.offsetY = 0;
    AppStorage.setOrCreate('isLongPress', false);
    /**
     * 恢复拖动中，被缩小的子组件，并提供动画。
     * 通过interpolatingSpring(0, 1, 400, 38)构造插值器弹簧曲线对象初始速度为0，质量为1，刚度为400，阻尼为38
     */
    animateTo({ curve: curves.interpolatingSpring(0, 1, 400, 38) }, () => {
      this.state = OperationStatus.DROPPING;
      if (index < this.modifier.length - 1) {
        this.modifier[index + 1].scale = 1;
      }
      if (index > 0) {
        this.modifier[index - 1].scale = 1;
      }
    })
    /**
     * 恢复被拖拽子组件的放大与阴影效果，并提供动画。
     * 通过interpolatingSpring(0, 1, 400, 38)构造插值器弹簧曲线对象初始速度为14，质量为1，刚度为170，阻尼为17
     */
    animateTo({ curve: curves.interpolatingSpring(14, 1, 170, 17) }, () => {
      this.state = OperationStatus.IDLE;
      this.modifier[index].hasShadow = false;
      this.modifier[index].scale = 1; // 初始化缩放比例
      this.modifier[index].offsetY = 0; // 初始化偏移量
    })
  }

  /**
   * Item交换位置
   * @param index
   * @param newIndex
   */
  changeItem(index: number, newIndex: number): void {
    const tmp: Array<T> = this.deductionData.splice(index, 1);
    this.deductionData.splice(newIndex, 0, tmp[0]);
    const tmp2: Array<ListItemModifier> = this.modifier.splice(index, 1);
    this.modifier.splice(newIndex, 0, tmp2[0]);
  }

  /**
   * 删除列表项
   * @param item
   */
  deleteItem(item: T): void {
    const index: number = this.deductionData.indexOf(item);
    this.dragRefOffset = 0;
    // TODO:知识点:左偏移以及透明度动画
    animateTo({
      // 总时间300ms
      curve: Curve.Friction, duration: 300, onFinish: () => {
        // TODO:知识点:列表项删除动画
        animateTo({
          // 总时间500ms
          curve: Curve.Friction, duration: 500, onFinish: () => {
            this.state = OperationStatus.IDLE;
          }
        }, () => {
          this.modifier.splice(index, 1);
          this.deductionData.splice(index, 1);
        })
      }
    }, () => {
      this.state = OperationStatus.DELETE;
      this.modifier[index].offsetX = 150; // 列表项左偏移150
      this.modifier[index].opacity = 0; // 列表项透明度为0
    })
  }
}