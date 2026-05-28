import { TitleBar } from '@abner/bar';
import { GridLayout, RefreshController } from '@abner/refresh';
import { RouterPath } from '@abner/router';
import { ListItemView } from '../../../../view/ListItemView';

/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/14
 * INTRODUCE:刷新加载
 * */

@RouterPath("example_GridLayoutRefreshAndLoadPage")
@Component
export struct GridLayoutRefreshAndLoadPage {
  controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
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
  itemLayout(_: Object, index: number): void {
    ListItemView({ index: index })
  }

  build() {
    Column() {
      TitleBar({ title: "普通数据刷新&加载(GridLayout)" })
      GridLayout({
        items: this.array,
        itemLayout: this.itemLayout,
        controller: this.controller,
        onRefresh: () => {
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 3000)
        },
        onLoadMore: () => {
          //模拟耗时
          setTimeout(() => {
            for (let i = 0; i < 20; i++) {
              this.array.push(i)
            }
            this.controller.finishLoadMore()
          }, 3000)
        }
      })
    }
  }
}
