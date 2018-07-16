# TouchPainer 编码组织

## 模型组织

Mark：
- 协议，定义一些需实现的属性、方法

Vertex：
- 顶点模型
- 遵循 Mark 协议，属性重新声明
- 提供自定义的初始化方法

实现了 `NSCopying` 协议的方法。`-copyWithZone:` 时，只调用了自定义的初始化方法。换句话说，只处理 `location` 属性。

实现了 `NSCoder` 协议的一些方法。只持久化了 `location` 属性。


Dot：
- 点模型
- 继承于 Vertex

实现了 `NSCopying` 协议的方法。`-copyWithZone:` 时，除了使用自定义初始化方法初始化外，还将其属性赋值了一遍。

实现了 `NSCoder` 协议的一些方法。调用了父类方法，并持久化了 `color`、`size` 属性。


Stroke
- 笔画属性
- 遵循 Mark 协议，属性重新声明

通过重写，屏蔽了 `location` 属性的 set 方法。get 方法也如此，返回了子节点的 `location`。

实现 `Mark` 协议中的核心方法。如下：

- `-addMark:`
- `-removeMark:`
- `-childMarkAtIndex:`
- `-lastChild`
- `-count`
- `-acceptMarkVistor:`
- `-enumerator`
- `-enumerateMarksUsingBlock:`

实现了 `NSCopying` 协议的方法。`-copyWithZone:` 中，复制了 `color`、`size` 属性，以及遍历复制了 `_children` 数组。

实现了 `NSCoder` 协议的一些方法。持久化了 `color`、`size` 和 `_children` 成员变量。

