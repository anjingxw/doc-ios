## 绘制步骤
- 调用CGContextBeginPath
- 调用CGContextMoveToPoint来设置路径的起点
- 调用CGPathAddLineToPoint, CGPathAddArc, CGPathAddRect等函数添加路径
- 最后，我们需要调用fill或stroke来绘制出这些路径或图形。


## CGContextRef
图形上下文(颜色, 画笔粗细，曲线&直线，绘制)
```
CGContextRef context = UIGraphicsGetCurrentContext();
```

## 属性
### 1. CGContextSetFillColor，设置填充颜色
```
double red[3] ={1.0, 0, 0};
CGContextSetFillColor(context, red);
```
### 2. CGContextSetStrokeColor， 描边颜色
```
double red[3] ={1.0, 0, 0};
CGContextSetStrokeColor(context, red);
```
### 3.

## 图形
### 1.0 直线点连接
移动到一个点，然后添加到下一个点得线，形成路径
绘制倒着的三角形如下。
Fill填充， Stroke边线。EOF, even-odd rule.
```
CGContextMoveToPoint(context, 100, 100);
CGContextAddLineToPoint(context, 200, 100);
CGContextAddLineToPoint(context, 150, 200);
CGContextAddLineToPoint(context, 100, 100);
CGContextDrawPath(context, kCGPathFillStroke);
```

## 绘制



## 保存和还原
画笔线条等状态保存
```
CGContextSaveGState(context);
CGContextRestoreGState(context);
```
## CGPath
- 用法
```
CGMutablePathRef path = CGPathCreateMutable();
CGPathMoveToPoint(path, NULL, 100, 100);
CGPathAddArcToPoint(path, NULL, 100, 200, 300, 200, 100);
CGContextAddPath(context, path);
CGContextSetStrokeColor(context, red);//属性要设置在CGContextAddPath（清空属性）后面
CGContextStrokePath(context);
```
## 优质博客
[博客-segmentfault](https://segmentfault.com/a/1190000004025309)