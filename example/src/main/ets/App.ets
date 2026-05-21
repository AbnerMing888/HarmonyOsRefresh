import { BarMenuType, initTitleBar } from '@abner/bar';
import { finishPage, getARouter,routerInitConfig } from '@abner/router';
import { AbilityStage } from '@kit.AbilityKit';
import { ExampleRouterConfig } from '../../../ExampleRouterConfig';


export class App extends AbilityStage {
  onCreate(): void {
    routerInitConfig([
      new ExampleRouterConfig(),
    ])

    this.init()
  }

  private init(){
    initTitleBar({
      onBarAttribute: (attr) => {
        attr.isAvoidanceNavigation = true //避开导航栏
        attr.leftMenuType = BarMenuType.IMAGE
        attr.leftIcon = $r("app.media.common_back")
        attr.onLeftClick = () => {
          finishPage()
        }
      }
    })
  }
}