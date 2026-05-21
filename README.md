## 介绍

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="100px" /><br/>
<span style="font-size:12px;color:red;">扫码关注，千帆起航，共筑鸿蒙！</span>
</p>

refresh是一款简单，高效的上拉下拉刷新组件，支持列表、网格、瀑布流、支持各种任意组件刷新，支持侧滑删除、条目吸顶，下滑二楼等功能。

同等功能的V2装饰器版本，可点击直达：[refresh_v2](https://ohpm.openharmony.cn/#/cn/detail/@abner%2Frefresh_v2)

**v1和V2使用方式完全一样，大家可无缝切换，只需修改下依赖即可。**

如果您只想简单的下拉刷新和上拉加载，并且耦合度低，建议您使用我的另一款**轻盈的刷新组件**，

v1版本：点击直达：[lithe_refresh](https://ohpm.openharmony.cn/#/cn/detail/@abner%2Flithe_refresh)

v2版本：点击直达：[lithe_refresh_v2](https://ohpm.openharmony.cn/#/cn/detail/@abner%2Flithe_refresh_v2)

主要功能点如下：

- 1、**支持List/Grid/WaterFlow等任意布局/下拉刷新/上拉加载**
- 2、**支持自定义刷新头和加载尾样式**
- 3、**支持List/Grid/WaterFlow等添加头和尾组件**
- 4、**支持列表(List)侧滑展示按钮，左右均可**
- 5、**支持网格(Grid)拖拽排序，支持设置禁止条目**
- 6、**支持下滑进入二楼/半楼功能（仿京东或淘宝）**
- 7、**数据操作（增删改查）提供便捷方式，适应更多场景运用**
- 8、**支持页面各种吸顶效果(List/Grid/WaterFlow)**
- 9、**支持默认进入页面自动刷新/手动刷新**
- 10、**支持内部缺省页设置（空布局/错误布局）**
- 11、**支持List条目分组吸顶效果**
- 12、**默认刷新头支持三个点旋转效果**
- 13、**List支持滑动直接删除**
- 14、**支持全局设置刷新头和加载尾，和全局设置属性**
- 15、**支持设置阻尼及阻尼系数和设置最大滑动距离**
- 16、**支持设置滑动至底部自动加载数据**
- 17、**支持底部加载数据回弹效果**
- 18、**支持底部显示暂无数据**

## 效果

### 所有功能

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_000.png" width="350px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_002.png" width="350px" />
</p>
<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_003.png" width="350px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_004.png" width="350px" />
</p>

### 刷新效果
<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_005.png" width="200px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_006.png" width="200px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_007.png" width="200px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_011.png" width="200px" />
</p>

### 列表自定义头部效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_008.png" width="200px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_009.png" width="200px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_010.png" width="200px" />
</p>

### 列表侧滑展示按钮效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/refresh/rv_012.png" width="200px" />
</p>

### 吸顶效果

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/sticky_top.png" width="200px" />
</p>

**动态效果：**

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_01.gif" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_06.gif" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_sf.gif" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/sticky_grid.gif" width="200px" />
</p>

## 支持Api版本

Api版本：>=12

### 远程依赖方式使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/refresh
```

方式二：在需要模块下的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/refresh": "^2.0.0"}
```

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/harmonyos_log_module.jpg" width="300"></p>


### 查看是否引用成功

无论使用哪种方式进行依赖，最终都会在使用的模块中，生成一个oh_modules文件，并创建源代码文件，有则成功，无则失败，如下：

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/harmonyos_refresh_oh.jpg" width="300"></p>

## 代码使用

自2.0.0版本之后，针对代码做了全量的优化，目前提供了拓展系统Refresh组件和完全自定义刷新组件两种方式，支持任意组件下拉刷新和上拉加载，提供几十种常见刷新案例，可满足大部分业务
场景。

### 自定义刷新组件

提供了四种用法，一种是ListView形式，就是单列表形式，一种是GridView形式，也就是网格列表形式，一种是StaggeredGridView形式，也就是
瀑布流形式，还有一种就是LitheView形式，支持任何的组件形式，比如Column，Row等等。

### 系统Refresh刷新组件

也是提供了四种方式，单列表形式ListLayout，网格列表形式GridLayout，瀑布流形式WaterFlowLayout，还有一种是任意组件形式RefreshView。

**大家可以按照自己的使用，选择一种使用即可，具体使用，大家可以查看相关Demo。**

### 全局初始化

可以根据自己需要，统一设置自己的刷新样式，如果默认的满足，可以不设置。

```typescript
 RefreshConfig.getInstance().init({
      // headerRefreshLayout: wrapBuilder(headerRefreshLayout), //全局自定义头
      // footerLoadLayout: wrapBuilder(footerLoadLayout), //全局自定义尾部
      // refreshHeaderAttr: (attr) => {//修改默认的刷新头属性
      //   attr.fontColor = Color.Red
      //   attr.fontSize = 18
      // },
    })
```

## 自定义刷新组件案例介绍(ListView/GridView/StaggeredGridView)

### 1、ListView

#### 1、懒加载数据使用（LazyForEach）

默认情况下既是，目的是进行组件销毁回收以降低内存占用，提高性能，当然了也是推荐使用，相对于普通使用，需要使用RefreshDataSource进行数据的增删改查！

```typescript

controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查

ListView({
  lazyDataSource: this.dataSource,
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onRefresh: () => {
    //下拉刷新
    //数据懒加载使用：
    //0、数据初始化，this.dataSource.initData()
    // 1、数组数据添加，this.dataSource.pushDataArray()，
    // 2、单个数据添加，this.dataSource.pushData()
    this.controller.finishRefresh() //关闭下拉刷新，在数据请求回后进行关闭
  },
  onLoadMore: () => {
    //上拉加载
    //数据懒加载使用：1、数组数据添加，this.dataSource.pushDataArray()，2、单个数据添加，this.dataSource.pushData()
    this.controller.finishLoadMore() //关闭上拉加载,在数据请求回后进行关闭
  }
})
/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 2、普通使用（ForEach）

普通使用正常的数据加载即可，只需关注数据源。

```typescript

controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量

ListView({
  items: this.array, //数据源 数组,任意类型
  itemLayout: (item, index) => this.itemLayout(item, index),
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onRefresh: () => {
    //下拉刷新
    this.controller.finishRefresh();//关闭刷新，在数据请求回后进行关闭
  },
  onLoadMore: () => {
    //上拉加载
    this.controller.finishLoadMore();//关闭加载，在数据请求回后进行关闭
  }
})

/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 3、相关属性介绍

| 属性                       | 类型                                          | 概述                                                 |
|--------------------------|---------------------------------------------|----------------------------------------------------|
| items                    | Array\<Object\>                             | 普通数据                                               |
| lazyDataSource           | RefreshDataSource                           | 懒加载数据，和普通数据二选一                                     |
| itemLayout               | @BuilderParam (item: Object, index: number) | 列表条目视图                                             |
| controller               | RefreshController                           | 控制器，用于关闭下拉和上拉                                      |
| onRefresh                | () => void                                  | 下拉刷新回调                                             |
| onLoadMore               | () => void                                  | 上拉加载回调                                             |
| lazyCachedCount          | number                                      | 懒加载缓存数据量，默认为1                                      |
| enableRefresh            | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，传递onRefresh即代表需要刷新       |
| enableLoadMore           | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，传递onLoadMore即代表需要上拉加载 |
| headerRefreshLayout      | @BuilderParam                               | 自定义下拉刷新头组件                                         |
| footerLoadLayout         | @BuilderParam                               | 自定义上拉加载尾组件                                         |
| itemHeaderLayout         | @BuilderParam                               | 传递的列表头组件                                           |
| itemFooterLayout         | @BuilderParam                               | 传递的列表尾部组件                                          |
| isScrollSpring           | boolean                                     | 是否是阻尼，默认true即是                                     |
| maxRefreshSpringDistance | number                                      | 最大的下拉刷新阻尼距离                                        |
| maxLoadSpringDistance    | number                                      | 最大上拉加载阻尼距离                                         |
| listAttribute            | ListAttr                                    | ListView的相关属性                                      |
| listItemAttribute        | ListItemAttr                                | ListView的Item相关属性                                  |
| refreshAttribute         | (attribute: RefreshAttr) => void            | 刷新基类相关属性                                           |
| refreshHeaderAttribute   | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                           |
| loadMoreFooterAttribute  | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                           |
| slideRightMenuLayout     | @BuilderParam (index: number)               | 右侧侧滑展示的按钮View                                      |
| slideMenuAttr            | 回调(attribute: SlideMenuAttr)                | 右侧侧滑按钮属性                                           |
| initialIndex             | number                                      | 设置当前List初次加载时视口起始位置显示的item的索引值。                    |
| scroller                 | Scroller                                    | 可滚动组件的控制器。用于与可滚动组件进行绑定。                            |
| emptyLayout              | @BuilderParam                               | 空布局                                                |
| errorLayout              | @BuilderParam                               | 错误布局                                               |
| loadingLayout            | @BuilderParam                               | 加载布局                                               |
| showEmptyLayout          | boolean                                     | 是否显示空                                              |
| showErrorLayout          | boolean                                     | 是否显示错误                                             |
| showLoadingLayout        | boolean                                     | 是否显示加载布局                                           |
| isSwipeDelete            | boolean                                     | 是否允许侧滑删除                                           |
| itemGroupData            | Array\<ItemGroupModel\>                     | 分组数据                                               |
| isLazyItemGroup          | boolean                                     | 分组情况下是否是懒加载数据                                      |
| itemGroupHeader          | @BuilderParam                               | 分组视图                                               |
| isAutoLoadMoreData       | boolean                                     | 是否需要自动加载更多数据                                       |
| pullDownRatio            | number                                      | 阻尼系数，用于控制手势下滑的阻塞感                                  |
| space                    | number/string                               | 间距                                                 |

##### RefreshController

| 属性                      | 参数                     | 概述                             |
|-------------------------|------------------------|--------------------------------|
| finishRefresh           | 无参                     | 关闭下拉刷新                         |
| finishLoadMore          | ooterNothing: boolean  | 关闭上拉加载，参数默认为false，为true则为无数据展示 |
| autoRefresh             | isAutoRefresh: boolean | 自动刷新，默认为true                   |
| markStartLocation       | start: boolean         | 标记开始位置                         |
| markEndLocation         | isEnd: boolean         | 标记结束位置                         |
| getRefreshLayoutStatus  | 无参                     | 获取下拉刷新状态                       |
| getLoadMoreLayoutStatus | 无参                     | 获取上拉加载状态                       |
| scrollToIndex           | value: number          | 滑动到某一个位置                       |
| scrollEdge              | value: Edge            | 滚动到容器边缘                        |


##### RefreshDataSource

数据懒加载操作对象，当使用数据懒加载时，必须通过此对象进行操作数据，否则无法生效！


```typescript
//传递懒加载对象
lazyDataSource:this.lazyDataSource
```

**相关属性介绍**

| 方法               | 类型                               | 概述                    |
|------------------|----------------------------------|-----------------------|
| initData         | (items: Array<Object>)           | 初始化数据                 |
| pushData         | (item: Object )                  | 可传递任意类型，用于添加单条数据      |
| pushDataPosition | (position: number, item: Object) | 指定位置添加数据              |
| pushDataVariable | (...items: Object[])             | 添加可变参数数据              |
| pushDataArray    | items: Object[]                  | 添加数组                  |
| deleteFirst      | 无参                               | 删除第一条数据               |
| deleteLast       | 无参                               | 删除最后一条数据              |
| deleteData       | (position: number)               | 删除一条数据                |
| deleteAll        | 回调接口                             | 参数可选，删除全部数据           |
| changeData       | (position: number, item: Object) | 修改数据                  |
| getDataAll       | 无参                               | 返回所有的数据 （返回值Object[]） |
| getData          | (index: number)                  | 返回某一条数据               |
| totalCount       | 无参                               | 返回数据数量（返回值number      |
| reloadData       | 无参                               | 重置所有子组件的index索引       |
| moveData         | (from: number, to: number)       | 交换数据                  |
| changeData       | (index: number, data: Object)    | 改变单个数据                |

##### ListAttr

| 属性                  | 类型            | 概述                                |
|---------------------|---------------|-----------------------------------|
| width               | Length        | 宽度                                |
| height              | Length        | 高度                                |
| backgroundColor     | ResourceColor | 背景颜色，默认透明                         |
| listDirection       | Axis          | 设置List组件排列方向。默认值：Axis.Vertical    |
| divider             | 对象            | 设置ListItem分割线样式，默认无分割线。           |
| scrollBar           | BarState      | 设置滚动条状态                           |
| cachedCount         | number        | 设置列表中ListItem/ListItemGroup的预加载数量 |
| edgeEffect          | EdgeEffect    | 设置组件的滑动效果，刷新加载效果下不支持              |
| scrollSpringHeight  | number        | 实现弹性物理动效，以设置最大高度为基准               |

##### ListItemAttr

| 属性              | 类型            | 概述        |
|-----------------|---------------|-----------|
| width           | Length        | 宽度        |
| height          | Length        | 高度        |
| backgroundColor | ResourceColor | 背景颜色，默认透明 |
| onClick         | 回调方法          | 点击事件      |

##### RefreshHeaderAttr

默认的刷新头属性

| 属性              | 类型                                        | 概述                                   |
|-----------------|-------------------------------------------|--------------------------------------|
| width           | Length                                    | 刷新控件的宽度                              |
| height          | Length                                    | 刷新头的高度 默认高度 80                       |
| timeFormat      | RefreshHeaderTimeFormat                   | 刷新头的时间格式,默认月日时分                      |
| timeLabel       | RefreshHeaderTimeLabel                    | 刷新头的标签格式                             |
| hideTime        | boolean                                   | 是否隐藏刷新头时间，默认展示                       |
| fontSize        | number / string / Resource                | 刷新头的文字大小                             |
| fontColor       | ResourceColor                             | 刷新头的文字颜色                             |
| timeFontSize    | number / string / Resource                | 刷新头的时间文字大小                           |
| timeFontColor   | ResourceColor                             | 刷新头的时间文字颜色                           |
| marginIconLeft  | Length                                    | 刷新文字距离左边的距离                          |
| iconDown        | PixelMap/ResourceStr/DrawableDescriptor   | 刷新的下拉箭头                              |
| iconUpLoad      | PixelMap / ResourceStr/DrawableDescriptor | 下拉刷新icon                             |
| pullingText     | string /Resource                          | 下拉可以刷新文本                             |
| releaseText     | string /Resource                          | 释放立即刷新文本                             |
| refreshingText  | string /Resource                          | 正在刷新中文本                              |
| finishText      | string /Resource                          | 刷新结束文本                               |
| backgroundColor | ResourceColor                             | 刷新头背景颜色                              |
| headerType      | RefreshHeaderType                         | 默认刷新头样式，默认是RefreshHeaderType.DEFAULT |
| iconWidth       | Length                                    | 下拉和Loading的宽度                        |
| iconHeight      | Length                                    | 下拉和Loading的高度                        |

##### LoadMoreFooterAttr

| 属性                 | 类型                                      | 概述         |
|--------------------|-----------------------------------------|------------|
| width              | Length                                  | 控件的宽度      |
| height             | Length                                  | 高度         |
| backgroundColor    | ResourceColor                           | 尾部背景颜色     |
| loadingSrc         | PixelMap/ResourceStr/DrawableDescriptor | 加载资源       |
| loadingIconWidth   | Length                                  | Loading的宽度 |
| loadingIconHeight  | Length                                  | Loading的高度 |
| loadingMarginRight | Length                                  | 距离右边文字的距离  |
| fontColor          | ResourceColor                           | 文字颜色       |
| fontSize           | number / string / Resource              | 文字大小       |
| fontWeight         | number / FontWeight/ string             | 文字权重       |
| fontFamily         | string / Resource                       | 字体         |
| footerPullingText  | string / Resource                       | 下拉提示       |
| footerReleaseText  | string / Resource                       | 释放提示       |
| footerLoadingText  | string / Resource                       | 加载提示       |
| footerFinishText   | string / Resource                       | 完成提示       |
| footerNothingText  | string / Resource                       | 无数据        |

##### RefreshHeaderTimeFormat

```text
  YMDHMS, //年月日时分秒 2024-04-08 08:08:08
  MDHMS, //月日时分秒 04-08 08:08:08
  MDHM, //月日时分秒 04-08 08:08
  HMS //时分秒 08:08:08
```

##### RefreshHeaderTimeLabel

```text
  BACKSLASH, //反斜杠 / 2024/04/08 08:08:08
  SHORTLINE, //短线 -  2024-04-08 08:08:08
  CHARACTERS //文字 年月日 2024年04月08日 08时08分08秒
```

### 2、GridView【网格】

#### 1、懒加载数据使用（LazyForEach）

默认情况下既是，目的是进行组件销毁回收以降低内存占用，提高性能，当然了也是推荐使用，相对于普通使用，需要使用RefreshDataSource进行数据的增删改查！

```typescript

controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查

GridView({
  lazyDataSource: this.dataSource,
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onRefresh: () => {
    //下拉刷新
    //数据懒加载使用：1、数组数据添加，this.dataSource.pushDataArray()，2、单个数据添加，this.dataSource.pushData()
    this.controller.finishRefresh() //关闭下拉刷新，在数据请求回后进行关闭
  },
  onLoadMore: () => {
    //上拉加载
    //数据懒加载使用：1、数组数据添加，this.dataSource.pushDataArray()，2、单个数据添加，this.dataSource.pushData()
    this.controller.finishLoadMore() //关闭上拉加载,在数据请求回后进行关闭
  }
})
/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 2、普通使用（ForEach）

普通使用正常的数据加载即可，只需关注数据源。

```typescript

@State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量

GridView({
        items: this.array, //数据源 数组,任意类型
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh();
        },
        onLoadMore: () => {
          //上拉加载
          this.controller.finishLoadMore();
        }
      })

/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 3、相关属性介绍

| 属性                       | 类型                                          | 概述                                                 |
|--------------------------|---------------------------------------------|----------------------------------------------------|
| columnSize               | number                                      | 展示几列                                               |
| items                    | Array\<Object\>                             | 普通数据                                               |
| lazyDataSource           | RefreshDataSource                           | 懒加载数据，和普通数据二选一                                     |
| itemLayout               | @BuilderParam (item: Object, index: number) | 列表条目视图                                             |
| controller               | RefreshController                           | 控制器，用于关闭下拉和上拉                                      |
| onRefresh                | () => void                                  | 下拉刷新回调                                             |
| onLoadMore               | () => void                                  | 上拉加载回调                                             |
| lazyCachedCount          | number                                      | 懒加载缓存数据量，默认为1                                      |
| enableRefresh            | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，传递onRefresh即代表需要刷新       |
| enableLoadMore           | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，传递onLoadMore即代表需要上拉加载 |
| headerRefreshLayout      | @BuilderParam                               | 自定义下拉刷新头组件                                         |
| footerLoadLayout         | @BuilderParam                               | 自定义上拉加载尾组件                                         |
| itemHeaderLayout         | @BuilderParam                               | 传递的列表头组件                                           |
| itemFooterLayout         | @BuilderParam                               | 传递的列表尾部组件                                          |
| isScrollSpring           | boolean                                     | 是否是阻尼，默认true即是                                     |
| maxRefreshSpringDistance | number                                      | 最大的下拉刷新阻尼距离                                        |
| maxLoadSpringDistance    | number                                      | 最大上拉加载阻尼距离                                         |
| gridAttribute            | GridAttr                                    | GridView相关属性                                       |
| gridItemAttribute        | GridItemAttr                                | GridView的Item相关属性                                  |
| refreshAttribute         | (attribute: RefreshAttr) => void            | 刷新基类相关属性                                           |
| refreshHeaderAttribute   | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                           |
| loadMoreFooterAttribute  | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                           |
| emptyLayout              | @BuilderParam                               | 空布局                                                |
| errorLayout              | @BuilderParam                               | 错误布局                                               |
| loadingLayout            | @BuilderParam                               | 加载布局                                               |
| showEmptyLayout          | boolean                                     | 是否显示空                                              |
| showErrorLayout          | boolean                                     | 是否显示错误                                             |
| showLoadingLayout        | boolean                                     | 是否显示加载布局                                           |
| isAutoLoadMoreData       | boolean                                     | 是否需要自动加载更多数据                                       |
| pullDownRatio            | number                                      | 阻尼系数，用于控制手势下滑的阻塞感                                  |


#### GridAttr

| 属性                  | 类型                      | 概述                                  |
|---------------------|-------------------------|-------------------------------------|
| width               | Length                  | 宽度                                  |
| height              | Length                  | 高度                                  |
| backgroundColor     | ResourceColor           | 背景颜色，默认透明                           |
| columnsTemplate     | string                  | 设置当前网格布局列的数量，不设置时默认2列，例如：1fr 1fr    |
| rowsTemplate        | string                  | 设置当前网格布局行的数量，不设置时默认1行，例如：1fr 1fr    |
| columnsGap          | Length                  | 设置列与列的间距。默认值：0                      |
| rowsGap             | Length                  | 设置行与行的间距。默认值：0                      |
| scrollBar           | BarState                | 设置滚动条状态。默认值：BarState.Off            |
| scrollBarColor      | string / number / Color | 设置滚动条的颜色。                           |
| scrollBarWidth      | string / number /       | 设置滚动条的宽度。                           |
| cachedCount         | number                  | 设置预加载的GridItem的数量，只在LazyForEach中生效。 |
| scrollSpringHeight  | number                  | 实现弹性物理动效，以设置最大高度为基准                 |

##### GridItemAttr

| 属性              | 类型               | 概述        |
|-----------------|------------------|-----------|
| width           | Length           | 宽度        |
| height          | Length           | 高度        |
| margin          | Margin / Length  | 边距        |
| padding         | Padding / Length | 内边距       |
| backgroundColor | ResourceColor    | 背景颜色，默认透明 |
| onClick         | 回调方法             | 点击事件      |


### 3、StaggeredGridView【瀑布流】

#### 1、懒加载数据使用（LazyForEach）

默认情况下既是，目的是进行组件销毁回收以降低内存占用，提高性能，当然了也是推荐使用，相对于普通使用，需要使用RefreshDataSource进行数据的增删改查！

```typescript

controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查

StaggeredGridView({
  lazyDataSource: this.dataSource,
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onRefresh: () => {
    //下拉刷新
    //数据懒加载使用：1、数组数据添加，this.dataSource.pushDataArray()，2、单个数据添加，this.dataSource.pushData()
    this.controller.finishRefresh() //关闭下拉刷新，在数据请求回后进行关闭
  },
  onLoadMore: () => {
    //上拉加载
    //数据懒加载使用：1、数组数据添加，this.dataSource.pushDataArray()，2、单个数据添加，this.dataSource.pushData()
    this.controller.finishLoadMore() //关闭上拉加载,在数据请求回后进行关闭
  }
})
/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 2、普通使用（ForEach）

普通使用正常的数据加载即可，只需关注数据源。

```typescript

@State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量

StaggeredGridView({
        items: this.array, //数据源 数组,任意类型
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        onRefresh: () => {
          //下拉刷新
          this.controller.finishRefresh();
        },
        onLoadMore: () => {
          //上拉加载
          this.controller.finishLoadMore();
        }
      })

/**
 * Author:AbnerMing
 * Describe:条目布局
 * @param item  数据对象
 * @param index  数据索引
 */
@Builder
itemLayout(item: Object, index: number): void {
  //条目视图，任意组件
}
```

#### 3、相关属性介绍

| 属性                      | 类型                                          | 概述                                               |
|-------------------------|---------------------------------------------|--------------------------------------------------|
| items                   | Array\<Object\>                             | 普通数据                                             |
| lazyDataSource          | RefreshDataSource                           | 懒加载数据，和普通数据二选其一                                  |
| lazyCachedCount         | number                                      | 懒加载缓存数据量，默认为1                                    |
| itemLayout              | @BuilderParam (item: Object, index: number) | 传递的条目布局                                          |
| headerRefreshLayout     | @BuilderParam                               | 自定义下拉刷新头组件                                       |
| footerLoadLayout        | @BuilderParam                               | 自定义上拉加载尾组件                                       |
| itemHeaderLayout        | @BuilderParam                               | 传递的列表头组件                                         |
| itemFooterLayout        | @BuilderParam                               | 传递的列表尾组件                                         |
| controller              | RefreshController                           | 控制器，关闭下拉和上拉                                      |
| onRefresh               | () => void                                  | 下拉刷新回调                                           |
| onLoadMore              | () => void                                  | 上拉加载回调                                           |
| enableRefresh           | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，onRefresh有代表需要刷新       |
| enableLoadMore          | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，onLoadMore有代表需要上拉加载 |
| sWidth                  | Length                                      | 宽度                                               |
| sHeight                 | Length                                      | 高度                                               |
| columnsGap              | Length                                      | 列与列的间距，默认为0                                      |
| rowsGap                 | Length                                      | 行与行的间距                                           |
| bgColor                 | ResourceColor                               | 整体的背景                                            |
| refreshHeaderAttribute  | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                         |
| loadMoreFooterAttribute | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                         |
| emptyLayout             | @BuilderParam                               | 空布局                                              |
| errorLayout             | @BuilderParam                               | 错误布局                                             |
| loadingLayout           | @BuilderParam                               | 加载布局                                             |
| showEmptyLayout         | boolean                                     | 是否显示空                                            |
| showErrorLayout         | boolean                                     | 是否显示错误                                           |
| showLoadingLayout       | boolean                                     | 是否显示加载布局                                         |
| isAutoLoadMoreData      | boolean                                     | 是否需要自动加载更多数据                                     |
| pullDownRatio           | number                                      | 阻尼系数，用于控制手势下滑的阻塞感                                |


### 4、LitheRefresh

支持任何组件刷新和加载,更多案例，可以查看相关Demo。

```typescript
LitheRefresh({
  itemLayout: this.itemLayout,
  controller: this.controller,
  onRefresh: () => {
    //下拉刷新
    setTimeout(() => {
      //模拟耗时
      this.controller.finishRefresh()
    }, 2000)
  },
  onLoadMore: () => {
    //加载更多
    setTimeout(() => {
      //模拟耗时
      this.controller.finishLoadMore()
    }, 2000)
  }
})
```

## 系统刷新组件Refresh封装案例介绍(ListLayout/GridLayout/WaterFlowLayout)

使用方式和ListView/GridView/StaggeredGridView,基本一致，就不过多介绍，只需要替换组件名字即可。

## 其他案例

案例很多，不能一一介绍，建议大家查看相关的Demo源码。

### 1、侧滑展示按钮

```typescript
ListView({
  // scroller:this.listScroller,//手动关闭时需要
  controller: this.controller,
  lazyDataSource: this.dataSource,
  itemLayout: (item, index) => this.itemLayout(item, index), //条目视图
  swipeRightMenuLayout: (index: number) => {
    this.slideRightMenuLayout(index)
  }, //侧滑视图
  swipeLeftMenuLayout: (index: number) => {
    //这里仅用于测试，可以设置不同的视图
    this.slideRightMenuLayout(index)
  }, //侧滑视图
  onRefresh: () => {
    setTimeout(() => {
      //模拟耗时
      this.controller.finishRefresh()
    }, 2000)
  }
})
```

### 2、下滑二楼功能

完整功能请查看Demo中的SecondFloorExample文件。

```typescript
SecondFloorLayout({
  firstFloorView: () => { //一楼视图
    this.firstFloorView(this)
  },
  isNeedHalfFloor: false, //是否需要半楼功能
  secondFloorView: this.secondFloorView, //二楼视图
  enableScrollInteraction: (isInteraction: boolean) => {
    //用于解决嵌套的滑动组件冲突
    this.mScrollInteraction = isInteraction
  },
  topFixedView: () => {
    //顶部固定视图
    this.topFixedView(this)
  },
  sfController: this.sfController, //刷新控制器
  refreshHeaderAttribute: (attr) => {
    //刷新头及二楼滑动属性配置
    attr.fontColor = Color.White
    attr.timeFontColor = Color.White
  },
  onRefresh: () => {
    //下拉刷新
    setTimeout(() => {
      this.sfController.finishRefresh()
    }, 2000)
  },
  onScrollStatus: (status) => {
    //当前的滑动状态

  }
})
```

#### RefreshLayoutStatus状态

```typescript
  Pulling, //拖拽  下拉可以刷新
Release, //释放立即刷新
Refreshing, //正在刷新中
Finish, //刷新结束
ReleaseHalfFloor, //释放进入半楼
HalfFloor, //进入半楼
FirstFloor, //一楼
ReleaseSecondFloor, //释放进入二楼
SecondFloor, //二楼状态
SecondFloorSlideUp //二楼向上滑动状态
```

#### RefreshHeaderAttr属性

默认的刷新头属性

| 属性                      | 类型                                        | 概述              |
|-------------------------|-------------------------------------------|-----------------|
| width                   | Length                                    | 刷新控件的宽度         |
| height                  | Length                                    | 刷新头的高度 默认高度 80  |
| timeFormat              | RefreshHeaderTimeFormat                   | 刷新头的时间格式,默认月日时分 |
| timeLabel               | RefreshHeaderTimeLabel                    | 刷新头的标签格式        |
| hideTime                | boolean                                   | 是否隐藏刷新头时间，默认展示  |
| fontSize                | number / string / Resource                | 刷新头的文字大小        |
| fontColor               | ResourceColor                             | 刷新头的文字颜色        |
| timeFontSize            | number / string / Resource                | 刷新头的时间文字大小      |
| timeFontColor           | ResourceColor                             | 刷新头的时间文字颜色      |
| marginIconLeft          | Length                                    | 刷新文字距离左边的距离     |
| iconDown                | PixelMap/ResourceStr/DrawableDescriptor   | 刷新的下拉箭头         |
| iconUpLoad              | PixelMap / ResourceStr/DrawableDescriptor | 下拉刷新icon        |
| pullingText             | string /Resource                          | 下拉可以刷新文本        |
| releaseText             | string /Resource                          | 释放立即刷新文本        |
| refreshingText          | string /Resource                          | 正在刷新中文本         |
| finishText              | string /Resource                          | 刷新结束文本          |
| releaseHalfFloorText    | string /Resource                          | 释放进入半楼文本        |
| halfFloorText           | string /Resource                          | 进入半楼文本          |
| firstFloorText          | string /Resource                          | 一楼文本            |
| releaseSecondFloorText  | string /Resource                          | 释放进入二楼文本        |
| secondFloorText         | string /Resource                          | 二楼状态文本          |
| secondFloorSlideUpText  | string /Resource                          | 二楼向上滑动状态文本      |

### 7、列表数据操作（增删改查）

【Demo案例可直接查看LazyDataOperationPage和DataOperationPage两个页面】

无论是懒加载数据方式还是普通列表加载方式，均提供了数据之间的操作，普通数据直接可以针对传递的数组进行操作，需要自己拿到
数组，直接对数组更改即可，懒加载方式需要获取RefreshDataSource，进行数据操作。

新的语言，对于一些小伙伴而言，在系统Api数据操作上可能略有阻碍，为了更好，更便捷的让大家使用，自1.0.7版本之后，对懒加载数据和普通数据做了优化和拓展。

大家只关注两个类即可，普通数据列表使用DataController，懒加载数据列表继续使用RefreshDataSource。

#### 普通数据列表操作

定义DataController全局变量，并传入列表之中（ListView/GridView/StaggeredGridView）。


```typescripty

dataController: DataController = new DataController() //数据控制器

 ListView({
        items: this.array, //数据源 数组
        dataController: this.dataController,
        isLazyData: false, //标记为普通加载，也就是使用ForEach
        itemLayout: (item, index) => this.itemLayout(item, index)
      })
      
```

相关方法如下：

```typescript
 //增加一个数据
 this.dataController.add(100)
//指定位置增加一个数据
this.dataController.addPosition(2, 999)
//数组添加
 this.dataController.addArray([200, 300, 400])
 //可变参数形式添加
this.dataController.addVariable(600, 700)
//删除第一个
this.dataController.deleteFirst()
//删除最后一个
this.dataController.deleteLast()
//删除指定一个
this.dataController.deleteData(2)
//删除全部
this.dataController.deleteAll()
//修改某一条数据
this.dataController.change(6, 1000)
```

##### DataController方法介绍


| 方法          | 参数                               | 概述                    |
|-------------|----------------------------------|-----------------------|
| add         | (item: Object )                  | 可传递任意类型，用于添加单条数据      |
| addPosition | (position: number, item: Object) | 指定位置添加数据              |
| addVariable | (...items: Object[])             | 添加可变参数数据              |
| addArray    | items: Object[]                  | 添加数组                  |
| deleteFirst | 无参                               | 删除第一条数据               |
| deleteLast  | 无参                               | 删除最后一条数据              |
| deleteData  | (position: number)               | 删除一条数据                |
| deleteAll   | 无参                               | 删除全部数据                |
| changeData  | (position: number, item: Object) | 修改数据                  |
| getDataAll  | 无参                               | 返回所有的数据 （返回值Object[]） |
| getData     | (index: number)                  | 返回某一条数据               |
| totalCount  | 无参                               | 返回数据数量（返回值number      |


#### 懒加载数据列表操作

定义RefreshDataSource全局变量，并传入列表之中（ListView/GridView/StaggeredGridView）。


```typescript
@State dataSource: RefreshDataSource = new RefreshDataSource() //数据懒加载操作对象，执行数据增删改查

ListView({
  items: this.array, //数据源 数组
  itemLayout: (item, index) => this.itemLayout(item, index),
  onLazyDataSource: (dataSource: RefreshDataSource) => {
    //必须实现此属性，用RefreshDataSource进行数据的操作
    this.dataSource = dataSource
  }
})

```

相关方法如下：

```typescript
//增加一个
this.dataSource.pushData(100)
//指定位置增加一个
this.dataSource.pushDataPosition(2, 200)
//数组添加
this.dataSource.pushDataArray([300, 301, 302])
 //可变参数形式添加
this.dataSource.pushDataVariable(400, 401, 402)
 //删除第一个
this.dataSource.deleteFirst()
 //删除最后一个
this.dataSource.deleteLast()
//删除指定一个
this.dataSource.deleteData(2)
 //删除全部
this.dataSource.deleteAll()
//修改数据
this.dataSource.changeData(3, 9999)
```

##### RefreshDataSource方法介绍


| 方法               | 参数                               | 概述                    |
|------------------|----------------------------------|-----------------------|
| pushData         | (item: Object )                  | 可传递任意类型，用于添加单条数据      |
| pushDataPosition | (position: number, item: Object) | 指定位置添加数据              |
| pushDataVariable | (...items: Object[])             | 添加可变参数数据              |
| pushDataArray    | items: Object[]                  | 添加数组                  |
| deleteFirst      | 无参                               | 删除第一条数据               |
| deleteLast       | 无参                               | 删除最后一条数据              |
| deleteData       | (position: number)               | 删除一条数据                |
| deleteAll        | 回调接口                             | 参数可选，删除全部数据           |
| changeData       | (position: number, item: Object) | 修改数据                  |
| getDataAll       | 无参                               | 返回所有的数据 （返回值Object[]） |
| getData          | (index: number)                  | 返回某一条数据               |
| totalCount       | 无参                               | 返回数据数量（返回值number      |


## 更多案例

可以查看相关Demo。

## 关注公众号

鸿蒙先驱者，只分享精华的鸿蒙或者移动端技术文章，可微信扫码关注

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150px" /></p>


[鸿蒙精华技术文章列表](https://juejin.cn/column/7269566781248389178)


## License

```
Copyright (C) AbnerMing, HarmonyOsRefresh Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
