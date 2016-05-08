
### UIBarItem,UIBarButtonItem,UINavigationItem
#### 关系 
- UINavigationBar 包含  UINavigationItem 
- UINavigationItem 包含 UIBarButtonItem 
- UIBarButtonItem ：UIBarItem 

### 说明
- UIBarItem 可以放置在Bar之上的控件类的抽象类。继承了该基类所有子类在外观上类似于一个Button。
有标题,图片(自己实现),动作以及目标（子类实现）。
- UIBarButtonItem 专门用来放在UIToolbar 或者 UINavigationBar的特殊button。基本行为跟button是一样的。
系统定义好的，有UIBarButtonSystemItem中的默认类型可选。
- UINavigationItem 包含了当前页面导航栏上需要显示的全部信息，是一个管理NSObject。
title,prompt,titleView,leftBarButtonItems,rightBarButtonItems,backBarButonItem
- UINavigationBar  是一个UIView
- UINavigtionController  包含viewcontrollers、navigationbar、toolbar

>NavigationController中只有一个NavigationBar（相当于全局），他管理每个navigationitem， navigationitem在栈中的每个控制器上显示。
>NavigationItem包含了bar视图的全部元素（如title,tileview,backBarButtonItem等），受当前viewcontroller管理，即NavigationBar形成整个nv的导航视图，然后每个nv页面的导航栏元素由所在页面的navigationItem管理。即设置当前页面的左右barbutton，用 self.navigationItem.leftBarButtonItem等。


### 要点
- title
self.navigationItem.title,self.tabBarItem.title,self.title关系为：self.title会重写另外两个的值。
- navigationItem
self.navigationItem  是定制当前view的 导航栏。根据当前的资料看，self.navigationController.navigationItem 是应该被忽视的属性，navigationcontroller继承与view controller，所以会有这个属性，但没有任何作用。
- prompt 
prompt 是一个NSString类型描述，注意添加该描述以后NavigationBar的高度会增加30，总的高度会变成74(不管当前方向是Portrait还是Landscape，此模式下navgationbar都使用高度44加上prompt30的方式进行显示)。