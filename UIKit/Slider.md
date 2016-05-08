### Slider

#### Value
##### Minimum
`var minimumValue: Float`
##### Maximum
`var maximumValue: Float`
##### Current
`var value: Float`

#### Min Image   靠近Min轨道图片
`var minimumValueImage: UIImage?`
#### Max Image   靠近Max轨道图片
`var maximumValueImage: UIImage?`

####Min Track Tint  靠近Min轨道颜色
`var minimumTrackTintColor: UIColor?`
####Max Track Tint  靠近Max轨道颜色
`var maximumTrackTintColor: UIColor?`
####Thumb Tint 光标颜色（拇指颜色）
`var thumbTintColor: UIColor?`

### Switch
####State
`var on: Bool` 
#### On Tint
`var onTintColor: UIColor?` 选中颜色
`var tintColor: UIColor!` 非选中颜色
#### Thumb Tint
`var thumbTintColor: UIColor?`
#### On  Image
`var onImage: UIImage?`
#### Off Image
`var offImage: UIImage?`

### UIActivityIndicator
#### Style
`init(activityIndicatorStyle style: UIActivityIndicatorViewStyle)`
`var activityIndicatorViewStyle: UIActivityIndicatorViewStyle`
- WhiteLarger 白色大
- White
- Gray

#### Color
`var color: UIColor?`

#### Behavior

##### Animating
`func startAnimating()`
##### Hides When Stopped
`var hidesWhenStopped: Bool`

### UIProgress
#### Style
`var progressViewStyle: UIProgressViewStyle`
- bar toolbar中使用
- default 

#### Progress
`var progress: Float`
#### Progress Tint
`var progressTintColor: UIColor?`
#### Track Tint
`var trackTintColor: UIColor?`
#### Progress Image
`var progressImage: UIImage?`
#### Track Image
`var trackImage: UIImage?`

### UIPageControl
多图展示的多个小圆点
#### Pages
##### # of Pages
`var numberOfPages: Int`
##### Current
`var currentPage: Int`
####  Behavior
##### Hides for single page
`var hidesForSinglePage: Bool` 只有一个界面隐藏
##### Defers  Page Display
`var defersCurrentPageDisplay: Bool`
调用 updateCurrentPageDisplay之前推迟更新
#### Tint Color
`var pageIndicatorTintColor: UIColor?`
#### Current Page
`var currentPageIndicatorTintColor: UIColor?`

### UIStepper
#### Vaule
##### Minumum
`var minimumValue: Double`
##### Maximum
`var maximumValue: Double`
##### Current
`var value: Double`
##### Step
`var stepValue: Double`

#### Behavior
##### Autorepeat
`var autorepeat: Bool`
控制是否在按住是自动持续递增或递减,默认YES
##### Continuous
`var continuous: Bool`
 控制是否持续触发UIControlEventValueChanged事件,默认YES
##### Wrap
`var wraps: Bool`
控制值是否在[minimumValue,maximumValue]区间内循环,默认NO
