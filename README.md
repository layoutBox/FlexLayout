<p align="center">
  <a href="https://github.com/lucdion/FlexLayout"><img src="docs/images/flexlayout-logo-2.png" alt="FlexLayout" width="270"/></a>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 3em">FlexLayout</h1>
 
<p align="center">
  <a href=""><img src="https://img.shields.io/cocoapods/p/FlexLayout.svg?style=flat" /></a>
  <a href="https://travis-ci.org/lucdion/FlexLayout"><img src="https://travis-ci.org/lucdion/FlexLayout.svg?branch=master" /></a>
  <a href="https://codecov.io/gh/lucdion/FlexLayout"><img src="https://codecov.io/gh/lucdion/FlexLayout/branch/master/graph/badge.svg"/></a>
  <a href='https://img.shields.io/cocoapods/v/FlexLayout.svg'><img src="https://img.shields.io/cocoapods/v/FlexLayout.svg" /></a>
  <a href="https://raw.githubusercontent.com/lucdion/FlexLayout/master/LICENSE"><img src="https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat" /></a>
</p>

<br>

FlexLayout gently wraps the highly optimized [facebook/yoga](https://github.com/facebook/yoga) flexbox implementation in a concise, and chainable syntax.

### Requirements
* iOS 8.0+
* Xcode 8.0+
* Swift 3.0+

### Content

* [Introduction example](#intro_usage_example)
* [FlexLayout principles and philosophy](#introduction)
* [Performance](#performance)
* [Documentation](#documentation)
	* [Creation, modification and definition of flexbox containers](#create_modify_define_containers)
	* [Flexbox containers properties](#containers_properties)
	* [Flexbox items properties](#intems_properties)
	* [Absolute positioning](#absolute_positioning)
	* [Adjusting the size](#adjusting_size)
		* [Width, height and size](#width_height_size)
		* [minWidth, maxWidth, minHeight, maxHeight](#minmax_width_height_size)
		* [Aspect Ratio](#aspect_ratio)
	* [Margins](#margins)
	* [Paddings](#paddings)
	* [Borders](#borders)
* [FAQ](#faq)
* [Comments, ideas, suggestions, issues, ....](#comments)
* [Installation](#installation)

<br>

:pushpin: FlexLayout is actively updated. So please come often to see latest changes. You can also **Star** it to be able to retrieve it easily later.

**FlexLayout + PinLayout**

<a href="https://github.com/mirego/PinLayout"><img src="docs/images/flexlayout_plus_pinlayout_small.png" alt="FlexLayout" width="250"/></a>

:pushpin: **FlexLayout** is a companion of **[PinLayout](https://github.com/mirego/PinLayout)**. They share a similar syntax and method names. PinLayout is a layout framework greatly inspired by CSS absolute positioning, it is particularly useful for greater fine control and animations. It gives you full control by layouting one view at a time (simple to code and debug). 

PinLayout can layout anything, but in situations where you need to layouts many views without requiring the finest control, FlexLayout is best fitted. 

A view layouted using PinLayout can be embedded inside a FlexLayout's flexbox container and reversely PinLayout can layout a FlexLayout view. You choose the best layout framework for your situation. 

<br>
 
### Yoga's layouting issues

:warning:	FlexLayout is a light wrapper around [Yoga](https://github.com/facebook/yoga). Yoga is still in development, so it is possible that you encounter issues when layouting your views, in these situations please have a look at [Yoga's issues](https://github.com/facebook/yoga/issues). Your issue may have been already reported. FlexLayout will always be up-to-date with the latest Yoga's version.

<br>

## FlexLayout Introduction example <a name="intro_usage_example"></a>
###### Example:
This example layout multiples views using column and row flexbox containers.

Two steps to use a flexbox container:

1. **Setup the container**: Initialize your flexbox structure. Note that it is also possible to alter it later. 
2. **Layout the container**: The layout of the container should be done from `layoutSubviews()` (or `willTransition(to: UITraitCollection, ...)` and `viewWillTransition(to: CGSize, ...)`). 
	1. First you must layout the flexbox container, i.e. position it and optionally set its size. 
	2. Then layout the flexbox children using Flex method `layout()`.

![](docs/images/examples/flexlayout-intro-example.png)

```swift
fileprivate let rootFlexContainer = UIView()

init() {
   super.init(frame: .zero)
   
   addSubview(rootFlexContainer)
   ...

   // Column container
   rootFlexContainer.flex.direction(.column).padding(12).define { (flex) in
        // Row container
        flex.addContainer().direction(.row).define { (flex) in
            flex.addItem(imageView).width(100).aspectRatio(of: imageView)
            
            // Column container
            flex.addContainer().direction(.column).paddingLeft(12).grow(1).define { (flex) in
                flex.addItem(segmentedControl).marginBottom(12).grow(1)
                flex.addItem(label)
            }
        }
        
        flex.addContainer().height(1).marginTop(12).backgroundColor(.lightGray)
        flex.addItem(bottomLabel).marginTop(12)
    }
}

override func layoutSubviews() {
    super.layoutSubviews() 

    // 1) Layout the flex container. This example use PinLayout for that purpose, but it could be done 
    //    also by setting the rootFlexContainer's frame:
    //       rootFlexContainer.frame = CGRect(x: 0, y: topLayoutGuide, 
    //                                        width: frame.width, height: rootFlexContainer.height)
    rootFlexContainer.pin.top().left().width(100%).marginTop(topLayoutGuide)

    // 2) Then let the flexbox container layout itself. Here the container's height will be adjusted automatically.
    rootFlexContainer.flex.layout(mode: .adjustHeight)
}
``` 

:pushpin: This example is available in the project Sample App. 

<br>

## FlexLayout principles and philosophy <a name="introduction"></a>

* Flexbox layouting is simple, powerful and fast.
* FlexLayout syntax is concise and chainable.
* FlexLayout/yoga is incredibly fast, it's even faster than manual layout. See [Performance](#performance).
* The source code structure matches the flexbox structure, making it easier to understand and modify. Flex containers are defined on one line, and its items (children) are imbricated. This makes the flexbox structure much more visual and easy to understand.
* Supports left-to-right (LTR) and right-to-left (RTL) languages.

NOTE: FlexLayout wraps [facebook/yoga](https://github.com/facebook/yoga) implementation and expose all its features. So note that on this documentation we will refer to FlexLayout, but this also applies to Yoga.

<br>

# FlexLayout's Performance <a name="performance"></a>

FlexLayout's performance has been measured using the nice LayoutKit benchmark. FlexLayout and [PinLayout](https://github.com/mirego/PinLayout) has been added to this benchmark to compare their performance. 

As you can see in the following chart, FlexLayout and PinLayout's performance are faster or equal to manual layouting. FlexLayout is **between 26x and 36x faster than auto layout** and PinLayout **between 12x and 16x faster than auto layout**, and this for all types of iPhone (5/6/6S/7)

These results also means that **FlexLayout and PinLayout are by far faster than any layout frameworks built over auto layout**. 

[See here more complete details, results and explanation of the benchmark](docs/benchmark/Benchmark.md).

<p align="center"> Tested on a iPhone 6 iOS 10.3.2</p>
<p align="center">
  <img src="docs/benchmark/benchmark_iphone6.png" alt="FlexLayout Performance" width=600/>
</p>

<br/>

## Variation from CSS flexbox

* In many CSS methods and properties name, the keyword `flex` was added to control name conflicts. FlexLayout removed this keyword for being more concise and removed this unecessary keyword:

	| FlexLayout Name     | CSS Name | React Native Name |
	|---------------------|----------|-------------------|
	| **`direction`** | `flex-direction` | `flexDirection` |
	| **`wrap`** | `flex-wrap` | `flexWrap` |
	| **`grow`** | `flex-grow` | `flexGrow` |
	| **`shrink`** | `flex-shrink` | `flexShrink` |
	| **`basis`** | `flex-basis` | `flexBasis` |
	| **`start`** | `flex-start` | `flexStart` |
	| **`end`** | `flex-end` | `flexEnd` |
	
	
* FlexLayout default properties are sligthly different from CSS flexbox. This table resume these difference:

	| Property     | FlexLayout default value | CSS default value | React Native default value |
	|--------------|--------------------------|-------------------|----------------------------|
	| **`direction`** | column | row | column |
	| **`justifyContent`** | start | start | start |
	| **`alignItems`** | stretch | stretch | stretch |
	| **`alignSelf`** | auto | auto | auto |
	| **`alignContent`** | start | stretch | start |
	| **`grow`** | 0 | 0 | 0 |
	| **`shrink`** | 1 | 1 | 0 |
	| **`basis`** | 0 | auto | 0 |

* **FlexLayout additions**: 
	* addItem()
	* addContainer()
	* define()
	* layout()
	* isIncludedInLayout()
	* markAsDirty()
	* intrinsicSize
	* sizeThatFits()

	
NOTE: **FlexLayout** doesn't support the flexbox `order` property. The order is  determined by the flex container's `UIView.subviews` array. 

<br>

# Documentation <a name="documentation"></a>

Flexbox is pretty easy and straightforward to use. The defining aspect of the flexbox is the ability to alter its items, width, height to best fill the available space on any display device. A flex container expands its items to fill the available free space or shrinks them to prevent overflow.

The flex layout is constituted of parent container referred as **flex container** and its immediate children which are called **flex items**. A flex item can also be a flex container, i.e. it is possible to add other flex items to it.

| Flexbox term        | Definition |
|---------------------|------------|
| **`main-axis`** | The main axis of a flex container is the primary axis along which flex items are laid out. The main-axis direction is set using the `direction()` property. |
| **`cross-axis`** | The axis perpendicular to the main axis is called the cross axis. Its direction depends on the main axis direction |
	
In the following sections we will see:

1. How to create, modify and defines flex containers and items.
2. Flexbox container's properties
3. Flexbox item's properties

<br>

## 1. Creation, modification and definition of flexbox items <a name="create_modify_define_containers"></a>

### addItem(:UIView)
- Applies to: `flex containers`
- Returns: FlexLayout interface of the newly added flex item.

**Method:**

* **`addItem(_: UIView) -> Flex`**  
This method adds a flex item (UIView) to a flex container. Internally the methods adds the UIView has subviews and enables flexbox.

###### Usage examples:
```swift
  view.flex.addItem(imageView).width(100).aspectRatio(1)
```
<br>

### addContainer()
- Applies to: `flex containers`
- Returns: FlexLayout interface of the newly created flex item.

**Method:**

* **`addContainer() -> Flex`**  
This method is similar to `addItem()` except that it also creates the flex container's UIView. Internally the method creates a UIView, adds it has subviews and finally enables flexbox. This is useful to add a flex container easily when you don't need to refer to it later.

###### Usage examples:
```swift
  view.flex.addContainer().direction(.row).padding(10)
```
<br>

### define()
- Applies to: `flex containers`
- Parameter: Closure of type `(flex: Flex) -> Void`

**Method:**

* **`define(_ closure: (_ flex: Flex) -> Void)`**  
This method is used to structure your code so that it matches the flexbox structure. The method has a closure parameter with a single parameter called `flex`. This parameter is in fact, the view's flex interface, it can be used to adds other flex items and containers. 

###### Usage examples:
```swift
  view.flex.addContainer().define { (flex) in
      flex.addItem(imageView).grow(1)
		
      flex.addContainer().direction(.row).define { (flex) in
          flex.addItem(titleLabel).grow(1)
          flex.addItem(priceLabel)
      }
  }
```

The same results can also be obtained without using the `define()` method, but the result is not as elegant:

```swift
  let columnContainer = UIView()
  columnContainer.flex.addItem(imageView).grow(1)
  view.flex.addItem(columnContainer)
		
  let rowContainer = UIView()
  rowContainer.flex.direction(.row)
  rowContainer.flex.addItem(titleLabel).grow(1)
  rowContainer.flex.addItem(priceLabel)
  columnContainer.flex.addItem(rowContainer)
```

**Advantages of using `define()`**:

- The source code structure matches the flexbox structure, making it easier to understand and modify.
	- Changing a flex item order, it's just moving up/down its line/block that defines it.
	- Moving a flex item from one container to another is just moving line/block that defines it.
- The structure looks more similar to how HTML and React Native defines it.
- Inside the `define`'s closure, you can do whatever you want to fill the flexbox container, you can use `for` loops, iterates arrays of data, call functions, ...
 
<br>
 
### Accessing flex items UIView <a name="accessing_flexbox_view"></a>
It is possible to access the flex items's UIView using `flex.view`. This is particularly usefull when using `flex.define()` method.

###### Example:
This example creates a flexbox container and sets its alpha to 0.8.

```swift
    flex.createBox().direction(.row).padding(20).alignItems(.center).define({ (flex) in
        flex.createBox().width(50).height(50).define({ (flex) in
            flex.view.alpha = 0.8
        }}
    })
``` 

Another possible solution:

```swift
    flex.createBox().direction(.row).padding(20).alignItems(.center).define({ (flex) in
        let container = UIView()
        container.alpha = 0.8
        
        flex.addChild(container).width(50).height(50)
    })
``` 
<br>

### layout()
- Applies to: `flex containers`
- Values: `fitContainer` / `adjustWidth` / `adjustHeight`
- Default value: `fitContainer `

**Method:**

* **`layout(mode: LayoutMode = . fitContainer)`**  
The method layout the flex container's children.

  Layout modes:

  * **`fitContainer`**: This is the default mode when no parameter is specified. Children are layouted **inside** the container's size (width and height). 
  * **`adjustHeight `**: In this mode, children are layouted **using only the container's width**. The container's height will be adjusted to fit the flexbox's children
  * **`adjustWidth `**: In this mode, children are layouted **using only the container's height**. The container's width will be adjusted to fit the flexbox's children

###### Usage examples:
```swift
  rootFlexContainer.flex.layout(mode: .adjustHeight)
```

<br>

## 2. Flexbox containers properties  <a name="containers_properties"></a>
This section describe all flex container's properties.

### direction() 
- Applies to: `flex containers`
- Values: `column` / `columnReverse` / `row` / `rowReverse`
- Default value: `column`
- CSS name: `flex-direction` 

**Method:**

* **`direction(_: Direction)`**  
The `direction` property establishes the main-axis, thus defining the direction flex items are placed in the flex container.

  The `direction` property specifies how flex items are laid out in the flex container, by setting the direction of the flex container’s main axis. They can be laid out in two main directions,  like columns vertically or like rows horizontally.

  Note that row and row-reverse are affected by the layout direction (see `layoutDirection` property) of the flex container. If its text direction is LTR (left to right), row represents the horizontal axis oriented from left to right, and row-reverse from right to left; if the direction is rtl, it's the opposite.


| Value | Result | Description |
|---------------------|:------------------:|---------|
| **column** (default) 	| <img src="docs/images/flexlayout-direction-column.png" width="100"/>| Top to bottom |
| **columnReverse** | <img src="docs/images/flexlayout-direction-columnReverse.png" width="100"/>| Bottom to top |
| **row** | <img src="docs/images/flexlayout-direction-row.png" width="190"/>| Same as text direction |
| **rowReverse** | <img src="docs/images/flexlayout-direction-rowReverse.png" width="190"/>| opposite to text direction |


###### Usage examples:
```swift
  view.flex.direction(.column)  // Not required, defaut value. 
  view.flex.direction(.row)
```
<br/>

### wrap()
- Applies to: `flex containers`
- Values: `noWrap` / `wrap` / `wrapReverse`
- Default value: `noWrap`
- CSS name: `flex-wrap` 

**Method:**

* **`wrap(_: Wrap)`**  
The `wrap` property controls whether the flex container is single-lined or multi-lined, and the direction of the cross-axis, which determines the direction in which the new lines are stacked in.

  By default, the flex container fits all flex items into one line. Using this property we can change that. We can tell the container to lay out its items in single or multiple lines, and the direction the new lines are stacked in

Reminder: the cross axis is the axis perpendicular to the main axis. Its direction depends on the main axis direction.


|                     	| direction(.column) | direction(.row) | Description|
|---------------------	|:------------------:|:---------------:|--------------|
| **noWrap** (default) 	| <img src="docs/images/flexlayout-wrap-column-nowrap.png" width="130"/>| <img src="docs/images/flexlayout-wrap-row-nowrap.png" width="180"/>| Single-line which may cause the container to overflow. NEW: Flex items are displayed in one row and by default they are shrunk to fit the flex container’s width |
| **wrap** | <img src="docs/images/flexlayout-wrap-column-wrap.png" width="130"/>| <img src="docs/images/flexlayout-wrap-row-wrap.png" width="180"/>| Multi-lines, direction is defined by `direction()`. NEW: Flex items are displayed in multiple rows if needed from left-to-right and top-to-bottom  |
| **wrapReverse**	| <img src="docs/images/flexlayout-wrap-column-wrapReverse.png" width="130"/>| <img src="docs/images/flexlayout-wrap-row-wrapReverse.png" width="180"/>| Multi-lines, opposite to direction defined by `direction()`. NEW: Flex items are displayed in multiple rows if needed from left-to-right and bottom-to-top |

###### Usage examples:
```swift
  view.flex.wrap(.nowrap)  // Not required, defaut value. 
  view.flex.wrap(.wrap)
```
<br/>

### justifyContent()
- Applies to: `flex containers`
- Values: `start` / `end` / `center` / `spaceBetween` / `spaceAround`
- Default value: `start`
- CSS name: `justify-content` 

**Method:**

* **`justifyContent(_: Justify)`**  
The `justifyContent` property defines the alignment along the main-axis of the current line of the flex container. It helps distribute extra free space leftover when either all the flex items on a line have reached their maximum size. For example, if children are flowing vertically, `justifyContent` controls how they align vertically. 

|                     	| direction(.column) | direction(.row) |
|---------------------	|:------------------:|:---------------:|
| **start** (default) 	| <img src="docs/images/flexlayout-justify-column-flexstart.png" width="140"/>| <img src="docs/images/flexlayout-justify-row-flexstart.png" width="160"/>|
| **end**	| <img src="docs/images/flexlayout-justify-column-flexend.png" width="140"/>| <img src="docs/images/flexlayout-justify-row-flexend.png" width="160"/>|
| **center** 	| <img src="docs/images/flexlayout-justify-column-center.png" width="140"/>| <img src="docs/images/flexlayout-justify-row-center.png" width="160"/>|
| **spaceBetween** 	| <img src="docs/images/flexlayout-justify-column-spacebetween.png" width="140"/>| <img src="docs/images/flexlayout-justify-row-spacebetween.png" width="160"/>|
| **spaceAround** 	| <img src="docs/images/flexlayout-justify-column-spacearound.png" width="140"/>| <img src="docs/images/flexlayout-justify-row-spacearound.png" width="160"/>|

###### Usage examples:
```swift
  view.flex.justifyContent(.start)  // defaut value. 
  view.flex.justifyContent(.center)
```
<br/>

### alignItems()
- Applies to: `flex containers`
- Values: `stretch` / `start` / `end` / `center` / `baseline`
- Default value: `stretch `
- CSS name: `align-items` 

**Method:**

* **`alignItems(_: Align)`**  
The `alignItems` property defines how flex items are laid out along the cross axis on the current line. Similar to `justifyContent` but for the cross-axis (perpendicular to the main-axis). For example, if children are flowing vertically, `alignItems` controls how they align horizontally. 


|                     	| direction(.column) | direction(.row) |
|---------------------	|:------------------:|:---------------:|
| **stretch** (default) 	| <img src="docs/images/flexlayout-align-column-stretch.png" width="140"/>| <img src="docs/images/flexlayout-align-row-stretch.png" width="160"/>|
| **start**	| <img src="docs/images/flexlayout-align-column-flexStart.png" width="140"/>| <img src="docs/images/flexlayout-align-row-flexStart.png" width="160"/>|
| **end**	| <img src="docs/images/flexlayout-align-column-flexEnd.png" width="140"/>| <img src="docs/images/flexlayout-align-row-flexEnd.png" width="160"/>|
| **center** 	| <img src="docs/images/flexlayout-align-column-center.png" width="140"/>| <img src="docs/images/flexlayout-align-row-center.png" width="160"/>|
| **baseline** 	| | <img src="docs/images/flexlayout-align-row-baseline.png" width="160"/>|

<br/>

### alignSelf()
- Applies to: `flex containers`
- Values: `auto` / `stretch` / `start` / `end` / `center` / `baseline`
- Default value: `auto`
- CSS name: `align-self` 

**Method:**

* **`alignSelf(_: Align)`**  
The `alignItems` property controls how a child aligns in the cross direction, overriding the `alignItems` of the parent. For example, if children are flowing vertically, `alignSelf` will control how the flex item will align horizontally. 

  The `auto` value means use the flex container `alignItems` property. See `alignItems` for documentation of the other values.

<br/>

### alignContent()
- Applies to: `flex containers`
- Values: `start` / `end` / `center` / `stretch` / `spaceBetween` / `spaceAround`
- Default value: `start`
- CSS name: `align-content`  

**Method:**

* **`alignContent(_: Align)`**  
The align-content property aligns a flex container’s lines within the flex container when there is extra space in the cross-axis, similar to how justifyContent aligns individual items within the main-axis.

Note, `alignContent` has no effect when the flexbox has only a single line.


|                     	| direction(.column) | direction(.row) |
|---------------------	|:------------------:|:---------------:|
| **start** (default) 	| <img src="docs/images/flexlayout-alignItems-column-flexStart.png" width="140"/>| <img src="docs/images/flexlayout-alignItems-row-flexStart.png" width="160"/>|
| **end**	| <img src="docs/images/flexlayout-alignItems-column-flexEnd.png" width="140"/>| <img src="docs/images/flexlayout-alignItems-row-flexEnd.png" width="160"/>|
| **center** 	| <img src="docs/images/flexlayout-alignItems-column-center.png" width="140"/>| <img src="docs/images/flexlayout-alignItems-row-center.png" width="160"/>|
| **stretch**	| <img src="docs/images/flexlayout-alignItems-column-stretch.png" width="140"/>| <img src="docs/images/flexlayout-alignItems-row-stretch.png" width="160"/>|
| **spaceBetween** | <img src="docs/images/flexlayout-alignItems-column-spaceBetween.png" width="160"/> | <img src="docs/images/flexlayout-alignItems-row-spaceBetween.png" width="160"/>|
| **spaceAround** | <img src="docs/images/flexlayout-alignItems-column-spaceAround.png" width="160"/> | <img src="docs/images/flexlayout-alignItems-row-spaceAround.png" width="160"/>|

<br/>


### layoutDirection()

FlexLayout supports left-to-right (LTR) and right-to-left (RTL) languages.

Using `start` or `end` properties, you can position views without having to think about whether your item will show up on the left or the right side of the screen (depending on the person’s language 

**Method:**

* **`layoutDirection(_: layoutDirection)`**  
The `layoutDirection` property controls the flex container layout direction. 

  Values:
  * **`.inherit`**  
Direction defaults to Inherit on all nodes except the root which defaults to LTR. It is up to you to detect the user’s preferred direction (most platforms have a standard way of doing this) and setting this direction on the root of your layout tree.
  * **`.ltr`**: Layout views from left to right. (Default)
  * **`.rtl`**: Layout views from right to left.

<br>

## 3. Flexbox items properties <a name="intems_properties"></a>
This section describe all flex items's properties.

:pushpin: Remembers that flex containers are also flex items, so all these properties also apply to containers.

### grow 
- Applies to: `flex items`
- Default value: 0
- CSS name: `flex-grow` 

**Method:**

* **`grow(_: CGFloat)`**  
The `grow` property defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.

  A grow value of 0 (default value) keeps the view's size in the main-axis direction. If you want the view to use the available space set a grow value > 0.

For example, if all items have `grow` set to 1, every child will set to an equal size inside the container. If you were to give one of the children a value of 2, that child would take up twice as much space as the others.

<br>

### shrink
- Applies to: `flex items`
- Default value: 1
- CSS name: `flex-shrink` 

**Method:**

* **`shrink(_: CGFloat)`**  
It specifies the "flex shrink factor", which determines how much the flex item will shrink relative to the rest of the flex items in the flex container when there isn't enough space on the main-axis.

  When omitted, it is set to 1 and the flex shrink factor is multiplied by the flex `basis` when distributing negative space.

  A shrink value of 0 keeps the view's size in the main-axis direction. Note that this may cause the view to overflow its flex container.

<br>

### basis
- Applies to: `flex items `
- Default value: 0
- CSS name: `flex-basis` 

**Method:**

* **`basis(_ : CGFloat?)`**   
This property takes the same values as the width and height properties, and specifies the initial size of the flex item, before free space is distributed according to the grow and shrink factors. 

  Specifying `nil` set the basis as `auto`, which means the length is equal to the length of the item. If the item has no length specified, the length will be according to its content 

<br>

### isIncludedInLayout()
- Applies to: `flex items`

**Method:**

* **`isIncludedInLayout(_ value: Bool)`**  
This property controls dynamically if a flexbox's UIView is included or not in the flexbox layouting. When a flexbox's UIView is excluded, FlexLayout won't layout the view and its children views.

FlexLayout automatically includes the UIView when:
* The first time `UIView.flex` property is accessed
* When a child view is added to a flexbox container using `addChild(:UIView)`
* When a flexbox container is created using `addContainer()`

<br>

### markAsDirty()
- Applies to: `flex items`

**Method:**

* **`markAsDirty()`**  
Yoga is so highly optimized, that flex item are layouted only when a flex property is changed and when flex container size change. In the event that you want to force FlexLayout to do a layout of a flex item, you can mark it as dirty using `markAsDirty()`. 

  Dirty flag propagates to the root of the flexbox tree ensuring that when any item is invalidated its whole subtree will be re-calculated.

###### Usage examples:
In the case where a UILabel's text is updated, it is needed to mark the label as dirty and relayout the flex container.

```swift
    // 1) Update UILabel's text
    label.text = "I love FlexLayout"
     
    // 2) Mark the UILabel as dirty
    label.flex.markAsDirty()
    
    // 2) Then relayout the flex container.
    rootFlexContainer.flex.layout()
```

<br>

### sizeThatFits()
- Applies to: `flex items`

**Method:**

* **`sizeThatFits()`**  
Returns the item size when layouted in the specified frame size.

###### Usage Example:
Get the size of view when layouted in a container with a width of 200 pixels.

```swift
    let layoutSize = viewA.flex.sizeThatFits(CGSize(width: 200, height: CGFloat.greatestFiniteMagnitude)
```

<br>

### intrinsicSize
- Applies to: `flex items`

**Property:**

* **`intrinsicSize`**  
Item natural size, considering only properties of the view itself. Independent of the item frame.

<br>

## 4. Absolute positioning  <a name="absolute_positioning"></a>
- Applies to: `flex items`
- Parameter: CGFloat

**Method:**

* **`position(_: Position)`**   
The position property tells Flexbox how you want your item to be positioned within its parent. Position values:
  * **`relative (default)`**
  * **`absolute`**: The view is positionned using properties: top(), bottom(), left(), right(), start(), end().

###### Usage examples:
```swift
  view.flex.position(.absolute).top(10).left(10).size(50)
```

### top(), bottom(), left(), right(), start(), end()
A flex item which is `position` is set to `.absolute` is positioned absolutely in regards to its parent. This is done through 6 properties:

**Methods:**

* **`top( value: CGFloat)`**:  
Controls the distance a child’s top edge is from the parent’s top edge
* **`bottom( value: CGFloat)`**:  
Controls the distance a child’s bottom edge is from the parent’s bottom edge
* **`left( value: CGFloat)`**:  
Controls the distance a child’s left edge is from the parent’s left edge
* **`right( value: CGFloat)`**:  
Controls the distance a child’s right edge is from the parent’s right edge
* **`start( value: CGFloat)`**:  
Controls the distance a child’s start edge is from the parent’s start edge. In left-to-right direction (LTR), it corresponds to the `left()` property and in RTL to `right()` property.
* **`end( value: CGFloat)`**:  
Controls the distance a child’s end edge is from the parent’s end edge. In left-to-right direction (LTR), it corresponds to the `right()` property and in RTL to `left()` property.

Using these properties you can control the size and position of an absolute item within its parent. Because absolutely positioned children don’t effect their sibling's layout with absolute position can be used to create overlays and stack children in the Z axis.

###### Usage examples:
```swift
  view.flex.position(.absolute).top(10).right(10).width(100).height(50)
```

<br>

## 5. Adjusting the size  <a name="adjusting_size"></a> 

### Width and height and size <a name="width_height_size"></a>

FlexLayout has methods to set the view’s height and width.

**Methods:**

* **`width(_ width: CGFloat)`**  
The value specifies the view's width in pixels. The value must be non-negative.
* **`width(percent: Percent)`**  
The value specifies the view's width in percentage of its flex container's width. The value must be non-negative.
* **`height(_ height: CGFloat)`**  
The value specifies the view's height in pixels. The value must be non-negative.
* **`height(percent: Percent)`**  
The value specifies the view's height in percentage of its flex container's height. The value must be non-negative.
* **`size(_ size: CGSize)`**  
The value specifies view's width and the height in pixels. Values must be non-negative.
* **`size(_ percent: Percent)`**
The value specifies the view's size in percentage of its flex container's size. The value must be non-negative.
* **`size(_ sideLength: CGFloat)`**  
The value specifies the width and the height of the view in pixels, creating a square view. Values must be non-negative.


###### Usage examples:
```swift
  view.flex.width(100)
  view.flex.width(of: view1)
	
  view.flex.height(200)
	
  view.flex.size(of: view1)
  view.flex.size(250)
```
<br>

### minWidth(), maxWidth(), minHeight(), maxHeight() <a name="minmax_width_height_size"></a>

FlexLayout has methods to set the view’s minimum and maximum width, and minimum and maximum height. 

Using minWidth, minHeight, maxWidth, and maxHeight gives you increased control over the final size of items in a layout. By mixing these properties with `grow`, `shrink`, and `alignItems(.stretch)`, you are able to have items with dynamic size within a range which you control.

An example of when Max properties can be useful is if you are using `alignItems(.stretch)` but you know that your item won’t look good after it increases past a certain point. In this case, your item will stretch to the size of its parent or until it is as big as specified in the Max property.

Same goes for the Min properties when using `shrink`. For example, you may want children of a container to shrink to fit on one row, but if you specify a minimum width, they will break to the next line after a certain point (if you are using `wrap(.wrap)`.

Another case where Min and Max dimension constraints are useful is when using `aspectRatio`.


**Methods:**

* **`minWidth(_ width: CGFloat)`** 
The value specifies the view's minimum width of the view in pixels. The value must be non-negative.

* **`maxWidth(_ width: CGFloat)`**  
The value specifies the view's maximum width of the view in pixels. The value must be non-negative.

* **`minHeight(_ height: CGFloat)`**
The value specifies the view's minimum height of the view in pixels. The value must be non-negative.

* **`maxHeight(_ height: CGFloat)`**
The value specifies the view's maximum height of the view in pixels. The value must be non-negative.
   
###### Usage examples:
```swift
  view.flex.maxWidth(200)
  view.flex.width(of: view1).maxWidth(250)
	
  view.flex.maxHeight(100)
  view.flex.height(of: view1).maxHeight(200)
```
<br>

### aspectRatio() <a name="aspect_ratio"></a>
AspectRatio is a property introduced by Yoga that don't exist in CSS. AspectRatio solves the problem of knowing one dimension of an element and an aspect ratio, this is very common when it comes to images, videos, and other media types. AspectRatio accepts any floating point value > 0, the default is undefined.

* AspectRatio is defined as the ratio between the width and the height of a node e.g. if a node has an aspect ratio of 2 then its width is twice the size of its height.
* AspectRatio respects the Min and Max dimensions of an item.
* AspectRatio has higher priority than `grow`.
* If AspectRatio, Width, and Height are set then the cross dimension is overridden

   
###### Usage examples:
```swift
  imageView.flex.aspectRatio(16/9)
```
<br/>


## 6. Margins <a name="margins"></a>
By applying Margin to an item you specify the offset a certain edge of the item should have from it’s closest sibling or parent.

**Methods:**

* `marginTop(_ value: CGFloat)`
* `marginLeft(_ value: CGFloat)`
* `marginBottom(_ value: CGFloat)`
* `marginRight(_ value: CGFloat)`
* `marginStart(_ value: CGFloat)`
* `marginEnd(_ value: CGFloat)`
* `marginHorizontal(_ value: CGFloat)`
* `marginVertical(_ value: CGFloat)`
* `margin(_ value: CGFloat) `
* `margin(_ vertical: CGFloat, _ horizontal: CGFloat)`
* `margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat)`
* `margin(_ top: CGFloat, _ right: CGFloat, _ bottom: CGFloat, _ left: CGFloat) `

###### Usage examples:
```swift
  view.flex.margin(20)
  view.flex.marginBottom(20)
  view.flex.marginHorizontal(20)
  view.flex.margin(10, 12, 0, 12)
```

<br>

## 7. Paddings <a name="paddings"></a>

Padding specify the **offset children should have** from a certain edge on the parent. 

**Methods:**

* `paddingTop(_ value: CGFloat)`
* `paddingLeft(_ value: CGFloat)`
* `paddingBottom(_ value: CGFloat)`
* `paddingRight(_ value: CGFloat)`
* `paddingStart(_ value: CGFloat)`
* `paddingEnd(_ value: CGFloat)`
* `paddingHorizontal(_ value: CGFloat)`
* `paddingVertical(_ value: CGFloat)`
* `padding(_ value: CGFloat) `
* `padding(_ vertical: CGFloat, _ horizontal: CGFloat)`
* `padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat)`
* `padding(_ top: CGFloat, _ right: CGFloat, _ bottom: CGFloat, _ left: CGFloat) `


###### Usage examples:
```swift
  view.flex.padding(20)
  view.flex.paddingBottom(20)
  view.flex.paddingHorizontal(20)
  view.flex.padding(10, 12, 0, 12)
```

<br>

## 8. Borders <a name="borders"></a>
Border behaves nearly identically to Padding and is only separate from Padding to make it easier to implement border effect such as color.

**Methods:**

* `borderLeft(_ value: CGFloat)`
* `borderTop(_ value: CGFloat)`
* `borderRight(_ value: CGFloat)`
* `borderBottom(_ value: CGFloat)`
* `borderStart(_ value: CGFloat)`
* `borderEnd(_ value: CGFloat)`
* `border(_ value: CGFloat)`

<br>


## 9. Extra UIView methods <a name="uiview_methods"></a>
FlexLayout also adds methods to set common UIView properties.

**Methods:**

* **`backgroundColor(_ color: UIColor)`**  
Set the flex item's UIView background color. 

###### Usage examples:
```swift
  // Create a gray column container and add a black horizontal line separator 
  flex.addContainer().backgroundColor(.gray).define { (flex) in
      flex.addContainer().height(1).backgroundColor(.black)
  } 
```

<br>


# Flexbox external links
* [THE flexbox CSS reference: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
* [Raywenderlich interesting Yoga tutorial](https://www.raywenderlich.com/161413/yoga-tutorial-using-cross-platform-layout-engine)
* [Flex Cheatsheet: Test flexbox properties using CSS](https://yoksel.github.io/flex-cheatsheet)
* [Mozialla: Advanced layouts with flexbox using CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Advanced_layouts_with_flexbox)

<br/>

# Installation <a name="installation"></a>

### CocoaPods

To integrate FlexLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
  pod 'FlexLayout'
```

Then, run `pod install`.

<br/>


## FAQ <a name="faq"></a>

*  **Q: How to keep the view size (width/height)?**  
   **R:** By default view's flex shrink value is set to 1, which reduce the size of the view if the view is bigger than its flex container in the main-axis direction. If the direction is column, the height is adjusted, if the direction is row, the width is adjusted. Setting this value to 0 will keep the view size in the main-axis direction.

<br/>

## Contributing, comments, ideas, suggestions, issues, .... <a name="comments"></a>
For any **comments**, **ideas**, **suggestions**, simply open an [issue](https://github.com/lucdion/FlexLayout/issues). 

For **issues**, please have a look at [Yoga's issues](https://github.com/facebook/yoga/issues). Your issue may have been already reported. If not, it may be a FlexLayout issue. In this case open an issue and we'll let you know if the issue is related to Yoga's implementation. 

If you find FlexLayout interesting, thanks to **Star** it. You'll be able to retrieve it easily later.

If you'd like to contribute, you're welcome!

<br>


## Changelog
FlexLayout recent history is available in the are documented in the [CHANGELOG](CHANGELOG.md).

<br>

## License
BSD 3-Clause License 
