## 介绍

基于ArkUI封装的上拉下拉刷新组件，支持列表、网格、瀑布流、支持各种任意组件刷新。

截至2024年5月22日，功能点如下

- 1、**支持ListView列表/下拉刷新/上拉加载**
- 2、**支持GridView网格列表/下拉刷新/上拉加载**
- 3、**支持StaggeredGridView瀑布流列表/下拉刷新/上拉加载**
- 4、**支持自定义刷新头和加载尾**
- 5、**支持列表(ListView/GridView/StaggeredGridView)添加头组件**
- 6、**支持列表(ListView)右侧侧滑展示按钮**
- 7、**支持下滑进入二楼/半楼功能（仿京东或淘宝）**
- 8、**数据操作（增删改查）提供便捷方式，适应更多场景运用**
- 9、**支持页面刷新加载吸顶效果(ListView/GridView/StaggeredGridView)**
- 10、**支持默认进入页面自动刷新/手动刷新**

## 效果

### 所有功能

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/root_001.png" width="300px" />
</p>

### 刷新效果
<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_02.jpeg" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_03.jpeg" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_04.jpeg" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_05.jpeg" width="200px" />
</p>

### 列表自定义头部效果

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_08.png" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_09.png" width="200px" />
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_10.png" width="200px" />
</p>

### 列表侧滑展示按钮效果

<p align="center">
<img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh_243_07.png" width="200px" />
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


## 开发环境

DevEco Studio NEXT Developer Beta1,Build Version: 5.0.3.100

Api版本：**11**

hvigorVersion：4.2.0

## 快速使用

有多种使用方式，比如远程依赖、本地静态共享包依赖,源码方式依赖，推荐使用**远程依赖**，方便快捷，有最新修改可以及时生效。

### 1、远程依赖方式使用【推荐】

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。
**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/refresh
```

方式二：在工程的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/refresh": "^1.1.1"}
```

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/harmonyos_log_module.jpg" width="300"></p>

### 2、本地静态共享包har包使用【不推荐】

<p>首先，下载har包，<a href="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/refresh-1.1.1.har">点击下载</a></p>
<p>下载之后，把har包复制项目中，目录自己创建，如下，我创建了一个libs目录，复制进去</p>
<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/harmonyos_refresh_har.jpg"></p>
<p>引入之后，进行同步项目，点击Sync Now即可，当然了你也可以，将鼠标放置在报错处会出现提示，在提示框中点击Run 'ohpm install'。</p>
<p>需要注意，<strong>@abner/refresh</strong>，是用来区分目录的，可以自己定义，比如@aa/bb等，关于静态共享包的创建和使用，请查看如下我的介绍，这里就不过多介绍</p>

[HarmonyOS开发：走进静态共享包的依赖与使用](https://juejin.cn/post/7274982412245876776)

### 查看是否引用成功

无论使用哪种方式进行依赖，最终都会在使用的模块中，生成一个oh_modules文件，并创建源代码文件，有则成功，无则失败，如下：

<p align="center"><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/refresh/harmonyos_refresh_oh.jpg" width="300"></p>

## 代码使用

目前提供了多种种用法，一种是ListView形式，就是单列表形式，一种是GridView形式，也就是网格列表形式，一种是StaggeredGridView形式，也就是
瀑布流形式，还有一种就是RefreshLayout形式，支持任何的组件形式，比如Column，Row等等。

需要注意，目前ListView、GridView、StaggeredGridView是自带刷新的，当然了您也可以当作普通的列表进行使用。
还有一点需要注意，目前默认情况下是**懒加载数据模式**。

### 1、ListView

#### 1、懒加载数据使用（LazyForEach）

默认情况下既是，目的是进行组件销毁回收以降低内存占用，提高性能，当然了也是推荐使用，相对于普通使用，需要使用RefreshDataSource进行数据的增删改查！

```typescript

@State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
@State dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查
        
ListView({
  items: this.array, //数据源 数组,任意类型
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onLazyDataSource: (dataSource: RefreshDataSource) => {
    this.dataSource = dataSource
  },
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

ListView({
        items: this.array, //数据源 数组,任意类型
        itemLayout: (item, index) => this.itemLayout(item, index),
        controller: this.controller, //控制器，负责关闭下拉和上拉
        isLazyData: false,//禁止懒加载，也就是使用ForEach进行数据加载
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

| 属性                      | 类型                                          | 概述                                                |
|-------------------------|---------------------------------------------|---------------------------------------------------|
| items                   | Array\<Object\>                             | 数据源                                               |
| itemLayout              | @BuilderParam (item: Object, index: number) | 传递的布局                                             |
| controller              | RefreshController                           | 控制器，关闭下拉和上拉                                       |
| onRefresh               | 回调                                          | 刷新回调                                              |
| onLoadMore              | 回调                                          | 上拉加载                                              |
| listAttribute           | ListAttr                                    | ListView的相关属性                                     |
| listItemAttribute       | ListItemAttr                                | ListView的Item相关属性                                 |
| isLazyData              | boolean                                     | 是否使用懒加载，默认是懒加载                                    |
| lazyCachedCount         | number                                      | 懒加载缓存数据量，默认为1                                     |
| onLazyDataSource        | 回调                                          | 懒加载数据回调                                           |
| itemHeaderLayout        | @BuilderParam                               | 传递的头组件                                            |
| headerRefreshLayout     | @BuilderParam                               | 自定义刷新头组件                                          |
| footerLoadLayout        | @BuilderParam                               | 自定义加载尾组件                                          |
| refreshHeaderAttribute  | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                          |
| loadMoreFooterAttribute | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                          |
| slideRightMenuLayout    | @BuilderParam (index: number)               | 右侧侧滑展示的View                                       |
| slideMenuAttr           | 回调(attribute: SlideMenuAttr)                | 右侧侧滑属性                                            |
| enableRefresh           | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，onRefresh有代表需要刷新        |
| enableLoadMore          | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，onLoadMore有代表需要上拉加载  |

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

懒加载数据的增删改查，必须实现属性：onLazyDataSource

```typescript
onLazyDataSource: (dataSource: RefreshDataSource) => {
          this.dataSource = dataSource
        }
```

**相关属性介绍**

| 方法            | 类型                            | 概述              |
|---------------|-------------------------------|-----------------|
| reloadData    | 无参                            | 重置所有子组件的index索引 |
| addData       | (index: number, data: Object) | 添加数据            |
| pushData      | (data: Object)                | 追加数据            |
| pushDataArray | (data: Array\<Object\>)       | 追加数组数据          |
| deleteData    | (index: number)               | 删除数据            |
| moveData      | (from: number, to: number)    | 交换数据            |
| changeData    | (index: number, data: Object) | 改变单个数据          |
| modifyAllData | 无参                            | 改变多个数据          |


##### ListAttr

| 属性              | 类型            | 概述                                |
|-----------------|---------------|-----------------------------------|
| width           | Length        | 宽度                                |
| height          | Length        | 高度                                |
| backgroundColor | ResourceColor | 背景颜色，默认透明                         |
| listDirection   | Axis          | 设置List组件排列方向。默认值：Axis.Vertical    |
| divider         | 对象            | 设置ListItem分割线样式，默认无分割线。           |
| scrollBar       | BarState      | 设置滚动条状态                           |
| cachedCount     | number        | 设置列表中ListItem/ListItemGroup的预加载数量 |
| edgeEffect      | EdgeEffect    | 设置组件的滑动效果                         |

##### ListItemAttr

| 属性              | 类型            | 概述        |
|-----------------|---------------|-----------|
| width           | Length        | 宽度        |
| height          | Length        | 高度        |
| backgroundColor | ResourceColor | 背景颜色，默认透明 |
| onClick         | 回调方法          | 点击事件      |

##### RefreshHeaderAttr

默认的刷新头属性

| 属性             | 类型                                        | 概述              |
|----------------|-------------------------------------------|-----------------|
| width          | Length                                    | 刷新控件的宽度         |
| height         | Length                                    | 刷新头的高度 默认高度 80  |
| timeFormat     | RefreshHeaderTimeFormat                   | 刷新头的时间格式,默认月日时分 |
| timeLabel      | RefreshHeaderTimeLabel                    | 刷新头的标签格式        |
| hideTime       | boolean                                   | 是否隐藏刷新头时间，默认展示  |
| fontSize       | number / string / Resource                | 刷新头的文字大小        |
| fontColor      | ResourceColor                             | 刷新头的文字颜色        |
| timeFontSize   | number / string / Resource                | 刷新头的时间文字大小      |
| timeFontColor  | ResourceColor                             | 刷新头的时间文字颜色      |
| marginIconLeft | Length                                    | 刷新文字距离左边的距离     |
| iconDown       | PixelMap/ResourceStr/DrawableDescriptor   | 刷新的下拉箭头         |
| iconUpLoad     | PixelMap / ResourceStr/DrawableDescriptor | 下拉刷新icon        |
| pullingText    | string /Resource                          | 下拉可以刷新文本        |
| releaseText    | string /Resource                          | 释放立即刷新文本        |
| refreshingText | string /Resource                          | 正在刷新中文本         |
| finishText     | string /Resource                          | 刷新结束文本          |

##### LoadMoreFooterAttr

| 属性     | 类型     | 概述    |
|--------|--------|-------|
| width  | Length | 控件的宽度 |
| height | Length | 高度    |

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

@State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
@State dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查

GridView({
  items: this.array, //数据源 数组,任意类型
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onLazyDataSource: (dataSource: RefreshDataSource) => {
    this.dataSource = dataSource
  },
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
        isLazyData: false,//禁止懒加载，也就是使用ForEach进行数据加载
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
| items                   | Array\<Object\>                             | 数据源                                              |
| itemLayout              | @BuilderParam (item: Object, index: number) | 传递的布局                                            |
| controller              | RefreshController                           | 控制器，关闭下拉和上拉                                      |
| onRefresh               | 回调                                          | 刷新回调                                             |
| onLoadMore              | 回调                                          | 上拉加载                                             |
| gridAttribute           | GridAttr                                    | GridView相关属性                                     |
| gridItemAttribute       | GridItemAttr                                | GridView的Item相关属性                                |
| isLazyData              | boolean                                     | 是否使用懒加载，默认是懒加载                                   |
| lazyCachedCount         | number                                      | 懒加载缓存数据量，默认为1                                    |
| onLazyDataSource        | 回调                                          | 懒加载数据回调                                          |
| itemHeaderLayout        | @BuilderParam                               | 传递的头组件                                           |
| headerRefreshLayout     | @BuilderParam                               | 自定义刷新头组件                                         |
| footerLoadLayout        | @BuilderParam                               | 自定义加载尾组件                                         |
| refreshHeaderAttribute  | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                         |
| loadMoreFooterAttribute | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                         |
| enableRefresh           | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，onRefresh有代表需要刷新       |
| enableLoadMore          | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，onLoadMore有代表需要上拉加载 |

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

懒加载数据的增删改查，必须实现属性：onLazyDataSource

```typescript
onLazyDataSource: (dataSource: RefreshDataSource) => {
          this.dataSource = dataSource
        }
```

**相关属性介绍**

| 方法            | 类型                            | 概述              |
|---------------|-------------------------------|-----------------|
| reloadData    | 无参                            | 重置所有子组件的index索引 |
| addData       | (index: number, data: Object) | 添加数据            |
| pushData      | (data: Object)                | 追加数据            |
| pushDataArray | (data: Array\<Object\>)       | 追加数组数据          |
| deleteData    | (index: number)               | 删除数据            |
| moveData      | (from: number, to: number)    | 交换数据            |
| changeData    | (index: number, data: Object) | 改变单个数据          |
| modifyAllData | 无参                            | 改变多个数据          |


##### GridAttr

| 属性              | 类型                      | 概述                                  |
|-----------------|-------------------------|-------------------------------------|
| width           | Length                  | 宽度                                  |
| height          | Length                  | 高度                                  |
| backgroundColor | ResourceColor           | 背景颜色，默认透明                           |
| columnsTemplate | string                  | 设置当前网格布局列的数量，不设置时默认2列，例如：1fr 1fr    |
| rowsTemplate    | string                  | 设置当前网格布局行的数量，不设置时默认1行，例如：1fr 1fr    |
| columnsGap      | Length                  | 设置列与列的间距。默认值：0                      |
| rowsGap         | Length                  | 设置行与行的间距。默认值：0                      |
| scrollBar       | BarState                | 设置滚动条状态。默认值：BarState.Off            |
| scrollBarColor  | string / number / Color | 设置滚动条的颜色。                           |
| scrollBarWidth  | string / number /       | 设置滚动条的宽度。                           |
| cachedCount     | number                  | 设置预加载的GridItem的数量，只在LazyForEach中生效。 |

##### GridItemAttr

| 属性              | 类型               | 概述        |
|-----------------|------------------|-----------|
| width           | Length           | 宽度        |
| height          | Length           | 高度        |
| margin          | Margin / Length  | 边距        |
| padding         | Padding / Length | 内边距       |
| backgroundColor | ResourceColor    | 背景颜色，默认透明 |
| onClick         | 回调方法             | 点击事件      |

##### RefreshHeaderAttr

默认的刷新头属性

| 属性             | 类型                                        | 概述              |
|----------------|-------------------------------------------|-----------------|
| width          | Length                                    | 刷新控件的宽度         |
| height         | Length                                    | 刷新头的高度 默认高度 80  |
| timeFormat     | RefreshHeaderTimeFormat                   | 刷新头的时间格式,默认月日时分 |
| timeLabel      | RefreshHeaderTimeLabel                    | 刷新头的标签格式        |
| hideTime       | boolean                                   | 是否隐藏刷新头时间，默认展示  |
| fontSize       | number / string / Resource                | 刷新头的文字大小        |
| fontColor      | ResourceColor                             | 刷新头的文字颜色        |
| timeFontSize   | number / string / Resource                | 刷新头的时间文字大小      |
| timeFontColor  | ResourceColor                             | 刷新头的时间文字颜色      |
| marginIconLeft | Length                                    | 刷新文字距离左边的距离     |
| iconDown       | PixelMap/ResourceStr/DrawableDescriptor   | 刷新的下拉箭头         |
| iconUpLoad     | PixelMap / ResourceStr/DrawableDescriptor | 下拉刷新icon        |
| pullingText    | string /Resource                          | 下拉可以刷新文本        |
| releaseText    | string /Resource                          | 释放立即刷新文本        |
| refreshingText | string /Resource                          | 正在刷新中文本         |
| finishText     | string /Resource                          | 刷新结束文本          |

##### LoadMoreFooterAttr

默认的加载尾属性

| 属性     | 类型     | 概述    |
|--------|--------|-------|
| width  | Length | 控件的宽度 |
| height | Length | 高度    |

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

### 3、StaggeredGridView【瀑布流】

#### 1、懒加载数据使用（LazyForEach）

默认情况下既是，目的是进行组件销毁回收以降低内存占用，提高性能，当然了也是推荐使用，相对于普通使用，需要使用RefreshDataSource进行数据的增删改查！

```typescript

@State controller: RefreshController = new RefreshController() //刷新控制器，声明全局变量
@State dataSource: RefreshDataSource = new RefreshDataSource()//数据懒加载操作对象，执行数据增删改查

StaggeredGridView({
  items: this.array, //数据源 数组,任意类型
  itemLayout: (item, index) => this.itemLayout(item, index), //条目布局
  controller: this.controller, //控制器，负责关闭下拉和上拉
  onLazyDataSource: (dataSource: RefreshDataSource) => {
    this.dataSource = dataSource
  },
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
        isLazyData: false,//禁止懒加载，也就是使用ForEach进行数据加载
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
| columnsTemplate         | string                                      | 展示几列，默认是两列，例如：1fr 1fr                            |
| columnsGap              | Length                                      | 列与列的间距，默认为0                                      |
| rowsGap                 | Length                                      | 行与行的间距                                           |
| bgColor                 | ResourceColor                               | 整体的背景                                            |
| sWidth                  | Length                                      | 宽度                                               |
| sHeight                 | Length                                      | 高度                                               |
| items                   | Array\<Object\>                             | 数据源                                              |
| itemLayout              | @BuilderParam (item: Object, index: number) | 传递的布局                                            |
| controller              | RefreshController                           | 控制器，关闭下拉和上拉                                      |
| onRefresh               | 回调                                          | 刷新回调                                             |
| onLoadMore              | 回调                                          | 上拉加载                                             |
| isLazyData              | boolean                                     | 是否使用懒加载，默认是懒加载                                   |
| lazyCachedCount         | number                                      | 懒加载缓存数据量，默认为1                                    |
| onLazyDataSource        | 回调                                          | 懒加载数据回调                                          |
| itemHeaderLayout        | @BuilderParam                               | 传递的头组件                                           |
| headerRefreshLayout     | @BuilderParam                               | 自定义刷新头组件                                         |
| footerLoadLayout        | @BuilderParam                               | 自定义加载尾组件                                         |
| refreshHeaderAttribute  | (attribute: RefreshHeaderAttr)              | 默认的刷新头属性                                         |
| loadMoreFooterAttribute | (attribute: LoadMoreFooterAttr)             | 默认的加载尾属性                                         |
| enableRefresh           | boolean                                     | 是否禁止刷新,也可以通过onRefresh进行控制，onRefresh有代表需要刷新       |
| enableLoadMore          | boolean                                     | 是否禁止上拉加载，也可以通过onLoadMore进行控制，onLoadMore有代表需要上拉加载 |

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

懒加载数据的增删改查，必须实现属性：onLazyDataSource

```typescript
onLazyDataSource: (dataSource: RefreshDataSource) => {
          this.dataSource = dataSource
        }
```

**相关属性介绍**

| 方法            | 类型                            | 概述              |
|---------------|-------------------------------|-----------------|
| reloadData    | 无参                            | 重置所有子组件的index索引 |
| addData       | (index: number, data: Object) | 添加数据            |
| pushData      | (data: Object)                | 追加数据            |
| pushDataArray | (data: Array\<Object\>)       | 追加数组数据          |
| deleteData    | (index: number)               | 删除数据            |
| moveData      | (from: number, to: number)    | 交换数据            |
| changeData    | (index: number, data: Object) | 改变单个数据          |
| modifyAllData | 无参                            | 改变多个数据          |


##### RefreshHeaderAttr

默认的刷新头属性

| 属性             | 类型                                        | 概述              |
|----------------|-------------------------------------------|-----------------|
| width          | Length                                    | 刷新控件的宽度         |
| height         | Length                                    | 刷新头的高度 默认高度 80  |
| timeFormat     | RefreshHeaderTimeFormat                   | 刷新头的时间格式,默认月日时分 |
| timeLabel      | RefreshHeaderTimeLabel                    | 刷新头的标签格式        |
| hideTime       | boolean                                   | 是否隐藏刷新头时间，默认展示  |
| fontSize       | number / string / Resource                | 刷新头的文字大小        |
| fontColor      | ResourceColor                             | 刷新头的文字颜色        |
| timeFontSize   | number / string / Resource                | 刷新头的时间文字大小      |
| timeFontColor  | ResourceColor                             | 刷新头的时间文字颜色      |
| marginIconLeft | Length                                    | 刷新文字距离左边的距离     |
| iconDown       | PixelMap/ResourceStr/DrawableDescriptor   | 刷新的下拉箭头         |
| iconUpLoad     | PixelMap / ResourceStr/DrawableDescriptor | 下拉刷新icon        |
| pullingText    | string /Resource                          | 下拉可以刷新文本        |
| releaseText    | string /Resource                          | 释放立即刷新文本        |
| refreshingText | string /Resource                          | 正在刷新中文本         |
| finishText     | string /Resource                          | 刷新结束文本          |

##### LoadMoreFooterAttr

默认的加载尾属性

| 属性     | 类型     | 概述    |
|--------|--------|-------|
| width  | Length | 控件的宽度 |
| height | Length | 高度    |

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

### 4、RefreshLayout

支持任何组件刷新和加载，前提在遇到滑动组件时，需要自己控制起始位置。

```typescript
RefreshLayout({
  controller: this.controller,
  itemLayout: () => this.itemLayout(), //条目布局
  onRefresh: () => {
    this.controller.finishRefresh()
  },
  onLoadMore: () => {
    this.controller.finishLoadMore()
  }
}
)
```

### 5、侧滑展示按钮

```typescript
ListView({
        items: this.array, //数据源 数组
        itemLayout: (item, index) => this.itemLayout(item, index),//条目视图
        slideRightMenuLayout: this.slideRightMenuLayout,//侧滑视图
        slideMenuAttr: (attr) => {
          //设置侧滑属性
          attr.rightMenuWidth = 100
        },
        onLazyDataSource: (dataSource: RefreshDataSource) => {
          //懒加载数据操作对象，用于执行数据的增删改查
          this.dataSource = dataSource
        }
      })
```

### 6、下滑二楼功能

完整功能请查看Demo中的SecondFloorPage文件。

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
| deleteAll        | 无参                               | 删除全部数据                |
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

## 一对一指导【收费】

每个人的时间都是宝贵的，做为开发者的我，已经做到了技术上的免费开源，但仍然有很多问题无法做到及时处理。 
也考虑到，鸿蒙是一个新的系统，大家在使用上会遇到各种各样的问题，也为了能够及时的解决及回复问题，大家可以付费进行一对一指导。

### 开源库使用指导

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/h_github_9.png" width="150px" /></p>

**重要信息：一定要在付款时备注您的微信号，我会主动加您！切记！切记！！切记！！！**
**诚信经营，来自一个北漂的老程序员心声！**

**一杯饮料的钱，您可以获取权益如下**

- 1、针对刷新库使用1对1辅导使用，并跟踪相关问题排查。
- 2、针对我的所有鸿蒙开源库，1对1辅导使用，并跟踪相关问题排查。
- 3、涉及到我的开源库，您提的业务需求，率先第一时间满足，并及时针对性开发。
- 4、未来我的鸿蒙开源库，可先遣体验。
- 5、鸿蒙脚手架，正在研发中，可首批次体验使用。


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
