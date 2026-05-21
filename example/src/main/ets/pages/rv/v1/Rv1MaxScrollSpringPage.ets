import { RefreshController, RefreshView } from '@abner/refresh'
import { TitleBar } from '@abner/bar'
import { RouterPath } from '@abner/router'
import { ListItemView } from '../../../view/ListItemView'

/**
 * AUTHOR:AbnerMing
 * DATE:2025/10/27
 * INTRODUCE:最大阻尼设置
 * */
@RouterPath("example_Rv1MaxScrollSpringPage")
@Component
export struct Rv1MaxScrollSpringPage {
  @State testArray: number[] = []
  scroller: Scroller = new Scroller()
  controller: RefreshController = new RefreshController()

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.testArray.push(i)
    }
  }

  @Builder
  itemLayout() {
    List({ scroller: this.scroller}) {
      ForEach(this.testArray, (_: number, index: number) => {
        ListItem() {
          ListItemView({ index: index })
        }
      }, (item: string, index: number) => JSON.stringify(item) + "_" + index)
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .width("100%")
    .height("100%")
    .padding({ left: 20, right: 20 })
    .nestedScroll({
      scrollForward: NestedScrollMode.PARENT_FIRST,
      scrollBackward: NestedScrollMode.PARENT_FIRST
    })
  }

  build() {
    Column() {

      TitleBar({
        title: "【最大阻尼】"
      })

      RefreshView({
        scroller: this.scroller,
        controller: this.controller,
        maxRefreshSpringDistance: 200, //设置最大刷新阻尼
        maxLoadSpringDistance: 200, //设置最大上拉阻尼
        itemLayout: () => {
          this.itemLayout()
        },
        onRefresh: () => {
          //下拉刷新
          setTimeout(() => {
            this.controller.finishRefresh()
          }, 2000)
        },
        onLoadMore: () => {
          //上拉加载
          setTimeout(() => {
            for (let i = 0; i < 20; i++) {
              this.testArray.push(i)
            }
            this.controller.finishLoadMore()
          }, 2000)
        }
      })
    }
  }
}