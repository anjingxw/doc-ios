### UIScrollView
#### Style
`var indicatorStyle: UIScrollViewIndicatorStyle`
滚动条风格：总共3个颜色：默认、黑、白
#### Scroll Indicators
##### Show Horizontal Indicators
`var showsHorizontalScrollIndicator: Bool`
##### Show Vertical Indicators
`var showsVerticalScrollIndicator: Bool`
#### Scrolling
##### Scrolling Enabled
`var scrollEnabled: Bool` 是否可以滚动
##### Paging Enabled
`var pagingEnabled: Bool` 自动停留边界
##### Direction Lock Enabled
`var directionalLockEnabled: Bool` 只能单方向滑动，滑动时候锁定另一方向
#### Bounce 反弹
##### Bounces
`var bounces: Bool` 是否允许反弹
##### Bounce Horizontally
`var alwaysBounceHorizontal: Bool`
##### Bounce Vertically
`var alwaysBounceVertical: Bool`
#### Zoom
##### Min
`var minimumZoomScale: CGFloat` zoom最小倍数 
##### Max
`var maximumZoomScale: CGFloat` zoom 最大倍数
#### Touch
##### Bounces Zoom
`var bouncesZoom: Bool` 超过min max 限制反弹会
##### Delays Content Touches
`var delaysContentTouches: Bool`
`是个布尔值，当值是 YES 的时候，用户触碰开始，scroll view要延迟一会，看看是否用户有意图滚动。`
##### Cancellable Content Touches
`var canCancelContentTouches: Bool`
当值是 YES 的时候，用户触碰后，然后在一定时间内没有移动，scrollView 发送 tracking events，然后用户移动手指足够长度触发滚动事件，这个时候，scrollView 发送了 touchesCancelled:withEvent: 到 subview，然后 scroView 开始滚动。假如值是 NO，scrollView 发送 tracking events 后，就算用户移动手指，scrollView 也不会滚动。

### UITableView
#### Content 
##### Dynamic Prototypes 动态模型
###### Prototype Cells  模型的数量

##### Static Cells  静态模型
所有包含的视图都可以和UITableViewControl建立关联关系
###### Sections  
Section 个数
#### Style
`var style: UITableViewStyle { get }`
- Plain
- Grouped  比Plain的Section 颜色深有边框 

#### Separator
`var separatorStyle: UITableViewCellSeparatorStyle` 
- None 没有
- SingleLine 单条线
- SingleLineEtched 单条线 腐蚀风化效果

#### Separator Inset
`var separatorInset: UIEdgeInsets` 
#### Selection 
`var allowsSelection: Bool` 允许一个选中
`var allowsMultipleSelection: Bool` 
#### Editing
`var allowsSelectionDuringEditing: Bool`
`var allowsSelectionDuringEditing: Bool`
##### Show Selection on Touch
没找到

#### Index Row Limit
`var sectionIndexMinimumDisplayRowCount: Int`
sectionIndexMinimumDisplayRowCount属性来指定当tableView中多少行的时候开始显示IndexList
例如 A，B，C...Z
#### Text
`var sectionIndexColor: UIColor?` A-Z 文字颜色
#### Background 
A-Z 背景颜色
##### Normal
`var sectionIndexTrackingBackgroundColor: UIColor?`
##### Tracking
`var sectionIndexTrackingBackgroundColor: UIColor?`
划过的背景颜色

### UITable View Cell
#### Style
`init(style style: UITableViewCellStyle,
reuseIdentifier reuseIdentifier: String?)`
- Default   icon+Label(Black)默认风格，自带标题和一个图片视图，图片在左
- Subtitle  icon+Label(Black, Top, Large)+ Label(Gray, Bottom, Small自带图片视图和主副标题，主副标题都在左边，副标题在下
- Value1    Label(Black, Left, Large)+ Label(Gray, Right, Large)只有标题和副标题 副标题在右边
- Value2    Label(Gray, Left, Small)+ Label(Black, Right, Large)只有标题和副标题，副标题在左边标题的下边


#### Indentifier
`var reuseIdentifier: String? { get }`
#### Selection
`var selectionStyle: UITableViewCellSelectionStyle`
None , Gray, Blue,Default 
#### Accessory
`var accessoryType: UITableViewCellAccessoryType`
右侧图标，detail，右箭头，对勾号等
#### Editing Acc.
`var editingAccessoryType: UITableViewCellAccessoryType`
编辑的时候的Accessory
#### Focus Style
`var focusStyle: UITableViewCellFocusStyle`

#### Indentation
##### Level
`var indentationLevel: Int`
设置内容区域的缩进级别, 影响自己Style中
##### Width
`var indentationWidth: CGFloat`
设置每个级别的缩进宽度
##### Indent While Editing
`var shouldIndentWhileEditing: Bool`
##### Shows Re-order Controls
设置是否显示cell自带的自动排序控件
`var shouldIndentWhileEditing: Bool`
##### Separator
设置是否显示cell自带的自动排序控件
`var separatorInset: UIEdgeInsets`