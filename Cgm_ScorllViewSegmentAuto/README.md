# CGM_SmallTool
封装的一些常用小工具

容器小工具， 最大限度的抽取出来了。减少耦合度
1， 声明了 init 创建方法 ， 以及对应UI 的属性方法。内部已经作了 自适应的处理 。会更具字体的大小来确定滑块的大小。

2，Demo 包含了封装的 CGM_ViewControllerSegment 直接拖到项目就可以 NSString+Helper还有这个 一起 拖到项目。

3， 使用时直接创建控制器 。标明标题就可以了。 然后在-(instancetype)initWithCtrltitle:(NSArray *)viewCtrl;
  使用这个传入 控制器 ，然后CGM_ViewControllerSegment 实例化加载到view  就可以 ，具体看demo
