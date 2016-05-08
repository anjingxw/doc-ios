### UIStackView
列或者行的集合的视图的界面

#### Axis 轴
#### Alignment
`var alignment: UIStackViewAlignment`
垂直于axis的布局
- Fill  所有视图填充满轴方向
- Leading 前向， left
- Top 上
- FirstBaseline  子视图的first baseline
- Center 中心
- Trailing（Bottom） 尾部，right，底部
- LastBaseline 子视图的last baseline

#### Distribution
`var distribution: UIStackViewDistribution`
沿着xis的views的布局
- Fill stack view重新改变被安排views的大小充满， shrinks by shrinks
， stretches by hugging， index in the arrangedSubviews array.
- FillEqually 等大小填充
- FillProportionally （等比例）views将基于views固有的内容大小在沿着stack view’s axis 相应的改变大小
- EqualSpacing  增加Space的方式，Space不变
- EqualCentering  改变Space，占用长度相同。

#### Space
`var spacing: CGFloat`
 arranged views  之间的间隔
#### Baseline Relative
`var baselineRelativeArrangement: Bool`
 vertical stack 时候 baselines布局views间的垂直距离
 
#### layoutMarginsRelativeArrangement：stackview安排它的views相对于他的布局边距

