### UITextField
单行

#### Text
#### Placeholder 
`var placeholder: String?`  提示信息
#### Background 
`var background: UIImage?`
#### Disabled
`var disabledBackground: UIImage?`
#### Border Style
`var borderStyle: UITextBorderStyle`
- none   无边框
- Line   边线
- bezel  边线+阴影
- roundrect  圆角边框

#### Clear Button
`var clearButtonMode: UITextFieldViewMode`
- Never 
- WhileEditing   编辑的时候显示
- UnlessEditing  没有正在编辑的时候显示
- Always 

#### Min Font Size
`var minimumFontSize: CGFloat`   允许最小字号
`var adjustsFontSizeToFitWidth: Bool` 是否允许调整字号，default NO

### UITextInputTraits  输入特征
#### Capitalization
自动大小写
`optional var autocapitalizationType: UITextAutocapitalizationType { get set }`
- None
- Words 单词的首字母大写
- Sentences  句子的首字母大写
- AllCharacters 所有字母都大写

#### Correction
`optional var autocorrectionType: UITextAutocorrectionType { get set } ` 是否自动纠错
- Default
- No 不自动纠错
- Yes  自动纠错

#### Spell Checking
`optional var spellCheckingType: UITextSpellCheckingType { get set } `
- Default  自动纠错开启的时候开启
- No 不拼写检查
- Yes  拼写检查

#### Keyboard Type
`optional var keyboardType: UIKeyboardType { get set } `
- Default   默认键盘，支持所有字符     
- ASCIICapable 支持ASCII的默认键盘
- NumbersAndPunctuation 标准电话键盘，支持*#字符
- URL  URL键盘，支持.com按钮 只支持URL字符
- NumberPad 数字键盘 
- PhonePad 电话键盘
- NamePhonePad 电话键盘，也支持输入人名
- EmailAddress 用于输入电子 邮件地址的键盘    
- DecimalPad 数字键盘 有数字和小数点
- Twitter 优化的键盘，方便输入@、#字符
- WebSearch

#### Appearance
`@property(nonatomic) UIKeyboardAppearance  keyboardAppearance `
- Default
- Dark
- Light

#### Return Key
 选择返回键，可以选择 Search 、 Return 、 Done 等。
`optional var returnKeyType: UIReturnKeyType { get set } `


##### Auto-enable Return key
`optional var enablesReturnKeyAutomatically: Bool { get set } `
但输入后返回键自动可用

##### Secure Text Entry
`optional var spellCheckingType: UITextSpellCheckingType { get set }`
是否加密
