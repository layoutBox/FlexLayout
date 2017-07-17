<p align="center">
  <a href="https://github.com/luc-dion/FlexLayout"><img src="docs/images/flexlayout-logo-2.png" alt="FlexLayout" width="270"/></a>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 3em">FlexLayout</h1>
 
<p align="center">
  <a href=""><img src="https://img.shields.io/cocoapods/p/FlexLayout.svg?style=flat" /></a>
  <a href="https://travis-ci.org/luc-dion/FlexLayout"><img src="https://travis-ci.org/luc-dion/FlexLayout.svg?branch=master" /></a>
  <a href="https://codecov.io/gh/luc-dion/FlexLayout"><img src="https://codecov.io/gh/luc-dion/FlexLayout/branch/master/graph/badge.svg"/></a>
  <a href='https://img.shields.io/cocoapods/v/FlexLayout.svg'><img src="https://img.shields.io/cocoapods/v/FlexLayout.svg" /></a>
  <a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" /></a>
  <a href="https://raw.githubusercontent.com/luc-dion/FlexLayout/master/LICENSE"><img src="https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat" /></a>
  <!--a href="https://github.com/luc-dion/FlexLayout/issues"><img src="https://img.shields.io/github/issues/luc-dion/FlexLayout.svg?style=flat" /></a-->
</p>

<br>

FlexLayout gently wraps [facebook/yoga](https://github.com/facebook/yoga) flexbox implementation in a concise, and chainable syntax.

<br>

### WARNING: This project is not ready yet and its still under development. Thanks for coming back later. 

<br>

### Requirements
* iOS 8.0+
* Xcode 8.0+
* Swift 3.0+

### Content

* [FlexLayout principles and philosophy](#introduction)
* [Performance](#performance)
* [Usage example](#intro_usage_example)
* [Documentation](#documentation)
  * [Layout using distances from superview’s edges](#distance_from_superview_edge) 	  
  * [Anchors](#anchors)
  * [Edges](#edges)
  * [Relative positionning](#relative_positionning)
  * [Width, height and size](#width_height_size)
  * [minWidth, maxWidth, minHeight, maxHeight](#minmax_width_height_size)
  * [justify, align](#justify_align)
  * [Margins](#margins)
  * [Warnings](#warnings)
  * [More examples](#more_examples)
* [Examples App](#examples_app)
* [Installation](#installation)
* [FAQ](#faq)
* [Comments, ideas, suggestions, issues, ....](#comments)


<br>

## FlexLayout principles and philosophy <a name="introduction"></a>

* Flexbox layouting is simple, powerfull and fast.
* FlexLayout syntax is concise and chainable.
* The syntax looks similar to HTML, where a container is defined on one line, and its children are imbricated.
* Moving a view from one flexbox container to another its just a problem of moving a block of code.
* FlexLayout/yoga incredibly fast, its even faster than manual layout. See performances below.
* FlexLayout is a companion of [PinLayout](https://github.com/mirego/PinLayout). They share the same type of syntax and methods name (ex: width, height, minWidth, maxWidth, marginTop, marginHorizontal, justify, ...). PinLayout is particularly usefull to position and animates views. 


## Variation from CSS flexbox
FlexLayout default properties are different from CSS flexbox. FlexLayout use the same default properties as Yoka and ReactNative flexbox.
....

* justify-content -> justify
* align-items -> align
//* align-content -> alignContent / alignWrap?
* flex-direction -> direction
* flex-wrap -> wrap
* flex-start -> start
* flex-end -> end


## Creation / definition : createBox / addChild/ define

# flex container

# flex items


## Direction, justity, align / alignContent / alignSelf / position
    public func direction(_ direction: Direction) -> Flexbox {
    public func justify(_ value: Justify) -> Flexbox {
    public func alignContent(_ value: Align) -> Flexbox {
    public func alignItems(_ value: Align) -> Flexbox {
    public func alignSelf(_ value: Align) -> Flexbox {
    public func position(_ value: Position) -> Flexbox {
    public func flexWrap(_ value: Wrap) -> Flexbox {
    public func overflow(_ value: Overflow) -> Flexbox {
    

## flexGrow / flexShrink / flexBasis
    public func grow(_ value: CGFloat) -> Flexbox {
    public func shrink(_ value: CGFloat) -> Flexbox {
    public func flexBasis(_ value: CGFloat) -> Flexbox {
    public func flex(_ grow: CGFloat, shrink: CGFloat? = nil, basis: CGFloat? = nil) -> Flexbox {
    This is the shorthand for flex-grow, flex-shrink and flex-basis combined. The second and third parameters (flex-shrink and flex-basis) are optional. Default is 0 1 auto

## Absolute positionning: left / top / right / bottom / start / end
    public func left(_ value: CGFloat) -> Flexbox {
    public func top(_ value: CGFloat) -> Flexbox {
    public func right(_ value: CGFloat) -> Flexbox {
    public func bottom(_ value: CGFloat) -> Flexbox {
    public func start(_ value: CGFloat) -> Flexbox {
    public func end(_ value: CGFloat) -> Flexbox {
    

## layout <a name="layout"></a>


## Width, height and size <a name="width_height_size"></a>

### Adjust view width, height and size
FlexLayout has methods to set the view’s height and width.

**Methods:**

* `width(_ width: CGFloat)` / `width(percent: Percent)`  
The value specifies the view's width in pixels. Value must be non-negative.
* `height(_ height: CGFloat)` / `height(percent: Percent)`  
The value specifies the view's height in pixels. Value must be non-negative.
* `size(_ size: CGSize)` / `size(_ percent: Percent)`  
The value specifies view's width and the height in pixels. Values must be non-negative.
* `size(_ sideLength: CGFloat)`  
The value specifies the width and the height of the view in pixels, creating a square view. Values must be non-negative.


###### Usage examples:
```swift
	view.flexbox.width(100)
	view.flexbox.width(of: view1)
	
	view.flexbox.height(200)
	
	view.flexbox.size(of: view1)
	view.flexbox.size(250)
```

### aspectRatio
...

<br/>

## minWidth, maxWidth, minHeight, maxHeight <a name="minmax_width_height_size"></a>

FlexLayout has methods to set the view’s minimum and maximum width, and minimum and maximum height. 

**Methods:**

* `minWidth(_ width: CGFloat)` 
The value specifies the view's minimum width of the view in pixels. Value must be non-negative.

* `maxWidth(_ width: CGFloat)`  
The value specifies the view's maximum width of the view in pixels. Value must be non-negative.

* `minHeight(_ height: CGFloat)`
The value specifies the view's minimum height of the view in pixels. Value must be non-negative.

* `maxHeight(_ height: CGFloat)`
The value specifies the view's maximum height of the view in pixels. Value must be non-negative.
   
###### Usage examples:
```swift
	view.flexbox.maxWidth(200)
	view.flexbox.width(of: view1).maxWidth(250)
	
	view.flexbox.maxHeight(100)
	view.flexbox.height(of: view1).maxHeight(200)
```

## Margins <a name="margins"></a>
FlexLayout ....

**Methods:**

* `marginTop(_ value: CGFloat)`
* `marginLeft(_ value: CGFloat)`
* `marginBottom(_ value: CGFloat)`
* `marginRight(_ value: CGFloat)`
* `marginHorizontal(_ value: CGFloat)`
* `marginVertical(_ value: CGFloat)`
* `margin(_ value: CGFloat) `
* `margin(_ vertical: CGFloat, _ horizontal: CGFloat)`
* `margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat)`
* `margin(_ top: CGFloat, _ right: CGFloat, _ bottom: CGFloat, _ left: CGFloat) `

###### Usage examples:
```swift
	view.flexbox.margin(20)
	view.flexbox.marginBottom(20)
	view.flexbox.marginHorizontal(20)
	view.flexbox.margin(10, 12, 0, 12)
```

<br>

## Paddings <a name="margins"></a>
FlexLayout ...

**Methods:**

* `paddingTop(_ value: CGFloat)`
* `paddingLeft(_ value: CGFloat)`
* `paddingBottom(_ value: CGFloat)`
* `paddingRight(_ value: CGFloat)`
* `paddingHorizontal(_ value: CGFloat)`
* `paddingVertical(_ value: CGFloat)`
* `padding(_ value: CGFloat) `
* `padding(_ vertical: CGFloat, _ horizontal: CGFloat)`
* `padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat)`
* `padding(_ top: CGFloat, _ right: CGFloat, _ bottom: CGFloat, _ left: CGFloat) `


###### Usage examples:
```swift
	view.flexbox.padding(20)
	view.flexbox.paddingBottom(20)
	view.flexbox.paddingHorizontal(20)
	view.flexbox.padding(10, 12, 0, 12)
```

<br>

## Border <a name="border"></a>

**Methods:**

* `borderLeft(_ value: CGFloat)`
* `borderTop(_ value: CGFloat)`
* `borderRight(_ value: CGFloat)`
* `borderBottom(_ value: CGFloat)`
* `borderStart(_ value: CGFloat)`
* `borderEnd(_ value: CGFloat)`
* `border(_ value: CGFloat)`


<br>

## Accessing flexbox's UIView
If is always possible to retrieve a flexbox's UIView using `flexbox.view`. This is particularly usefull when using `Flexbox.define()` method.

###### Example:
This example creates a flexbox container and sets its background color and add rounded corners.
![Flowers](docs/01-example-distance-superview-edge.png)

```swift
    flexbox.createBox().direction(.row).padding(20).alignItems(.center).define({ (flexbox) in
        flexbox.createBox().width(50).height(50).define({ (flexbox) in
            flexbox.view.backgroundColor = UIColor.red
            flexbox.view.layer.cornerRadius = 10
        }}
    })
``` 

Another possible solution:

```swift
    flexbox.createBox().direction(.row).padding(20).alignItems(.center).define({ (flexbox) in
        let container = UIView()
        container.backgroundColor = UIColor.red
        container.layer.cornerRadius = 10
        
        flexbox.addChild(container).width(50).height(50)
    })
``` 

<br>

## isEnabled
It is possible to control dynamically if a flexbox container is enabled or not. 
When a flexbox container's is disabled, FlexLayout won't layout its children, but note that its padding will be applied. If you want to completely hide the container, you should use `flexbox.isVisible`. 

** Property & Method:**

* `isEnabled: Bool`
* `isEnabled(: Bool)`

FlexLayout enable flexbox when:
* The first time `UIView.flexbox` property is accessed
* When a child view is added to a flexbox container using `addChild(:UIView)`
* When a flexbox container is created using `createBox()`

<br>

## isVisible

** Property & Method:**

* `isVisible: Bool`
* `isVisible(: Bool)`

<br>

## isIncludedInLayout ???

# FlexLayout's Performance <a name="performance"></a>

FlexLayout's performance has been measured using the nice and simple LayoutKit benchmark. FlexLayout has been added to this benchmark to compare its performance. 

As you can see in the following chart, FlexLayout's performance is as fast as manual layouting, and **between 12x and 16x faster than auto layout**, for all types of iPhone (5/6/6S/7)

These results also means that ** FlexLayout is faster than any layout frameworks that is built over auto layout**. 

[See here more complete details, results and explanation of the benchmark](docs/Benchmark.md).

<p align="center"> Tested on a iPhone 6 iOS 10.3.2</p>
<p align="center">
  <img src="docs/Benchmark/Benchmark-iPhone6.png" alt="FlexLayout Performance" width=600/>
</p>


<br/>


### Contributing, comments, ideas, suggestions, issues, .... <a name="comments"></a>
For any **comments**, **ideas**, **suggestions**, **issues**, simply open an [issue](https://github.com/luc-dion/FlexLayout/issues).

If you find FlexLayout interresting, thanks to **Star** it. You'll be able to retrieve it easily later.

If you'd like to contribute, you're welcome!

<br>


## Changelog
FlexLayout recent history is available in the are documented in the [CHANGELOG](CHANGELOG.md).

<br>

## License
BSD 3-Clause License