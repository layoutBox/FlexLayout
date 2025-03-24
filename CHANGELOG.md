<p align="center">
	<img src="docs_markdown/images/flexlayout-logo-2.png" alt="FlexLayout and PinLayout Performance" width=100/>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">FlexLayout</h1>


# Change Log

## [2.2.0](https://github.com/layoutBox/FlexLayout/releases/tag/2.2.0)

#### Upgrade yoga to v3.2.1

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#271](https://github.com/layoutBox/FlexLayout/pull/266)

#### Upgrade yoga to v3.1.0

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#266](https://github.com/layoutBox/FlexLayout/pull/266)


## [2.0.10](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.10)

#### Support `align-content`: `space-evenly`

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#255](https://github.com/layoutBox/FlexLayout/pull/255)


## [2.0.9](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.9)

#### Add `static` position feature

Add feature for the static position supported in Yoga version 3.0.0.
- Due to the default behavior of Yoga, insets like top, left, bottom, and right also affect relative position view. Accordingly, the README, docs and comments have been updated to match the Yoga specifications.
- Added static case to position and unit tests.

https://www.yogalayout.dev/docs/styling/position
https://www.yogalayout.dev/docs/styling/insets

Added by [heoblitz](https://github.com/heoblitz) in Pull Request [#245](https://github.com/layoutBox/FlexLayout/pull/254)

## [2.0.7](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.7)

#### Update yoga to version 3.0.4

Added by [heoblitz](https://github.com/heoblitz) in Pull Request [#245](https://github.com/layoutBox/FlexLayout/pull/252)


## [2.0.06](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.07)

#### Remove FlexLayoutYoga duplicate dependency in Swift Package

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#245](https://github.com/layoutBox/FlexLayout/pull/245)


## [2.0.06](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.06)

#### Fix error that occur when creating XCFramework

Background

- Public header issue occurs when using Objective-C package in [Tuist](https://github.com/tuist/tuist)'s Dependency. To resolve this issue, I want to provide xcframework.
- Resolve the issue that occurs when creating xcframework due to duplicate 'postfix operator %'.

Contents

- remove unnecessary files and headers
  - Modified to manage yoga directly in FlexLayout. Buck dependency is now unnecessary.
- remove duplicated postfix operator
- update Podfile.lock
- remove Info.plist
- move `FlexLayout.h` to public header directory

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#244](https://github.com/layoutBox/FlexLayout/pull/244)



## [2.0.05](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.05)
Released on 2024-01-11

#### 1) Add `Gap` support

Add `Gap` methods: 

- `columnGap(_ value: CGFloat) -> Flex`
- `rowGap(_ value: CGFloat) -> Flex`
- `gap(_ value: CGFloat) -> Flex`

##### background
After [Yoga layout updated to 2.0.0](https://github.com/layoutBox/FlexLayout/pull/230) the gap func added. and as needed by [this issue](https://github.com/layoutBox/FlexLayout/issues/235) and my company's product, me and my partner @TaekH made feature to use. 🙇‍♂️

Added by [Buseong Kim](https://github.com/Skyline-23) in Pull Request [#241](https://github.com/layoutBox/FlexLayout/pull/241) 


#### 2) Fix "Child already has a owner" Assert

Upgrading to the latest version of Yoga introduced an assert in YGNodeInsertChild() that was previously removed accidentally (see relevant commit). This assert will throw an error if the node we are trying to add already has an owner. Unfortunately, we can fall into this case quite easily if we move a view between different superviews (as demonstrated in the following contrived example).

Restoring the changes from this old commit [c303faa](https://github.com/layoutBox/FlexLayout/commit/c303faae7b7b441872f8d49dbd1424db6ec7953f) should ensure that any lingering parent references are cleaned up before we call YGNodeInsertChild()

Added by [kennethpu](https://github.com/kennethpu) in Pull Request [#242](https://github.com/layoutBox/FlexLayout/pull/242)



## [2.0.04](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.04)
Released on 2024-01-06

#### Enhance Swift Package experience

- Change the Swift Package Manager to be available without `FLEXLAYOUT_SWIFT_PACKAGE` flag
- add public header path
- remove `FLEXLAYOUT_SWIFT_PACKAGE`
- remove library for internal (FlexLayoutYoga, FlexLayoutYogaKit)
- move the unit test to the swift package with XCTest

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#232](https://github.com/layoutBox/FlexLayout/pull/232)

#### Split the Example project in 2 projects (Cocoapods & SPM)

Split the Example project in 2 projects:

* `FlexLayoutSample`: Use cocoapods dependency manager
* `FlexLayoutSample-SPM`: Use SPM (Swift Packager Manager) dependency manager

Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#240](https://github.com/layoutBox/FlexLayout/pull/240) 


## [2.0.03](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.03)
Released on 2023-10-15

#### Fix crashes that occurs when the node's topLeft position is nan

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#230](https://github.com/layoutBox/FlexLayout/pull/234)


## [2.0.01](https://github.com/layoutBox/FlexLayout/releases/tag/2.0.01)
Released on 2023-10-01

#### Update Yoga core to 2.0

FlexLayout version has been increased to reflect the new Yoga core version.

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#230](https://github.com/layoutBox/FlexLayout/pull/230)


## [1.3.33](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.33)
Released on 2023-06-24

#### Resolve lldb debug issue when using CocoaPods

## Background

- Since #219 was merged, LLDB problems have occurred in environments where CocoaPods and SPM are used together.
- This reverts commit f36c766865df29ac70f31b604dde54c5a975819c. (#219)

## Changes

- Revert f36c766865df29ac70f31b604dde54c5a975819c commit to resolve
- The existing problem is solved by writing each package.swift like the code below


```swift
// in Package.swift
.target(
  name: "SomeTarget",
  dependencies: [
    "FlexLayout",
  ],
  cSettings: [
    .define("FLEXLAYOUT_SWIFT_PACKAGE"),
  ],
  cxxSettings: [
    .define("FLEXLAYOUT_SWIFT_PACKAGE"),
  ],
  swiftSettings: [
    .define("FLEXLAYOUT_SWIFT_PACKAGE"),
  ]
)
```

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#226](https://github.com/layoutBox/FlexLayout/pull/226)


## [1.3.32](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.32)
Released on 2023-05-10

#### Fixes an issue where YGApplyLayoutToViewHierarchy assigns a value to frame.size that does not rounded to the pixel grid

Added by [Dongkyu Kim](https://github.com/stleamist) in Pull Request [#225](https://github.com/layoutBox/FlexLayout/pull/225)


## [1.3.31](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.31)
Released on 2023-04-12

#### Fix for Swift 5.8 

Added by [Rachik Abidi](https://github.com/RachikAbidi) in Pull Request [#223](https://github.com/layoutBox/FlexLayout/pull/223)

## [1.3.30](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.30)
Released on 2023-02-28

#### Fixes issue while including FlexLayout as a dependency of another Swift Package

Fixes issue [#219](https://github.com/layoutBox/FlexLayout/issues/219) where including FlexLayout as a dependency of another swift package would fail to build - because it isn't possible to set the preprocessor definition `FLEXLAYOUT_SWIFT_PACKAGE` without an Xcode project.

Added by [Luke Wakeford](https://github.com/lukewakeford) in Pull Request [#221](https://github.com/layoutBox/FlexLayout/pull/221)


## [1.3.29](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.29)
Released on 2023-02-28

#### Add `border(_ width: CGFloat, _ color: UIColor)` 

Added by [gyuchan](https://github.com/gyuchan) in Pull Request [#216](https://github.com/layoutBox/FlexLayout/pull/216)

## [1.3.28](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.28)
Released on 2023-02-25

#### Add `Flex.direction` property

Added by [gyuchan](https://github.com/gyuchan) in Pull Request [#213](https://github.com/layoutBox/FlexLayout/pull/213)


## [1.3.27](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.27)
Released on 2023-01-20

#### Round pixel values of intrinsicSize with YGRoundPixelValue

Added by [Dongkyu Kim](https://github.com/stleamist) in Pull Request [#210](https://github.com/layoutBox/FlexLayout/pull/210)


## [1.3.26](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.26)
Released on 2023-01-20

#### Fixed crash with nan dimensions

Added by [iohin](https://github.com/iohin) in Pull Request [#211](https://github.com/layoutBox/FlexLayout/pull/211)

## [1.3.25](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.25)
Released on 2022-12-23

#### Add `flex.cornerRadius(_ value: CGFloat)` function

Added by [minhaaan](https://github.com/minhaaan) in Pull Request [#209](https://github.com/layoutBox/FlexLayout/pull/209)

## [1.3.24](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.24)
Released on 2022-04-08

#### Change the access control of margin padding functions

Added by [OhKanghoon](https://github.com/OhKanghoon) in Pull Request [#199](https://github.com/layoutBox/FlexLayout/pull/199)


## [1.3.23](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.23)
Released on 2021-11-22

#### Percent padding support.
New methods:

* `paddingTop(_ percent: FPercent)`**
* `paddingLeft(_ percent: FPercent)`**
* `paddingBottom(_ percent: FPercent)`**
* `paddingRight(_ percent: FPercent)`**
* `paddingStart(_ percent: FPercent)`**
* `paddingEnd(_ percent: FPercent)`**
* `paddingHorizontal(_ percent: FPercent)`**
* `paddingVertical(_ percent: FPercent)`**

Added by [albertocs-noma](https://github.com/albertocs-noma) in Pull Request [#159](https://github.com/layoutBox/FlexLayout/pull/187)



## [1.3.22](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.22)
Released on 2021-10-25

## [1.3.20](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.20)
Released on 2020-05-29

Add baseline item support. 
Note that for now baseline support is only for the first baseline. 

Added by [Michael Ong](https://github.com/rantingmong) in Pull Request [#159](https://github.com/layoutBox/FlexLayout/pull/159)

## [1.3.18](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.18)
Released on 2020-05-01

Adds Swift Package Manager Support

Added by [gcox](https://github.com/gcox) in Pull Request [#150](https://github.com/layoutBox/FlexLayout/pull/150)

## [1.3.17](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.17)
Released on 2019-10-090

Add new methods to position items in absolute positionning (https://github.com/layoutBox/FlexLayout#4-absolute-positioning):

* **`vertically(: CGFloat)`** / **`vertically(: FPercent)`**:  
Controls the distance child’s top and bottom edges from the parent’s edges. Equal to `top().bottom()`.
* **`horizontally(: CGFloat)`** / **`horizontally(: FPercent)`**:  
Controls the distance child’s left and right edges from the parent’s edges. Equal to `left().right()`.
* **`all(: CGFloat)`** / **`all(: FPercent)`**:  
Controls the distance child’s edges from the parent’s edges. Equal to `top().bottom().left().right()`.

Added by [Kuluum](https://github.com/Kuluum) in Pull Request [#146](https://github.com/layoutBox/FlexLayout/pull/146) 

## [1.3.16](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.16)
Released on 2019-08-03

* Delegate isIncludedInLayout to yoga vs using default value:  
Previously the value of `isIncludedInLayout` may have not reflect what the underlying yoga value is as the developer may have manipulated the yoga value directly. This could potentially leave the Flex initial value out of sync. This change defers the get/set of this property to yoga.
    * Added by [Dan Loman](https://github.com/namolnad) in Pull Request [#131](https://github.com/layoutBox/FlexLayout/pull/137) 


## [1.3.15](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.15)
Released on 2019-06-07

* Fix public extension warning
    * Added by [Levi McCallum](https://github.com/levi) in Pull Request [#131](https://github.com/layoutBox/FlexLayout/pull/131) 
* Update to Swift 4.2
* Update cocoapods to 1.7

## [1.3.14](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.14)
Released on 2019-05-17

Add method: 
* `basis(_ : FPercent)`: This method is similar to `basis(_ : CGFloat?)` but takes a percentage parameter.

* Added by [Andreas Mattsson](https://github.com/AndreasMattsson) in Pull Request [#128](https://github.com/layoutBox/FlexLayout/pull/128) 

## [1.3.11](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.10)
Released on 2018-08-09 

Fix top padding in method `padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat)`.

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#107](https://github.com/layoutBox/FlexLayout/pull/107) 

## [1.3.10](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.10)
Released on 2018-07-24 

Add cocoapods c++ library dependency to the podspec file. Required to avoid possible linking errors.

* Added by [Antoine Lamy](https://github.com/antoinelamy) in Pull Request [#103](https://github.com/layoutBox/FlexLayout/pull/103) 

## [1.3.9](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.9)
Released on 2018-05-31 

Removed alignItems `.baseline` mode which is not currently supported by Yoga. So we remove it from the list of supported mode until Yoga support it.

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#94](https://github.com/layoutBox/FlexLayout/pull/94) 


## [1.3.8](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.8)
Released on 2018-05-09

Add `display(:Display)` method to set the Yoga's display property.

* Added by [cielpy](https://github.com/cielpy) in Pull Request [#87](https://github.com/layoutBox/FlexLayout/pull/87) 

## [1.3.7](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.7)
Released on 2018-05-01

Upgrade to Swift 4.1

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#85](https://github.com/layoutBox/FlexLayout/pull/85) 

## [1.3.6](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.6)
Released on 2018-04-16

Update the Podspec minimum iOS platform to 8.0

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#78](https://github.com/layoutBox/FlexLayout/pull/78) 

## [1.3.5](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.5)
Released on 2018-03-06

Add supports for `spaceEvenly` justifyContent mode

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#66](https://github.com/layoutBox/FlexLayout/pull/66) 
	
Flex view's getter is public once again.

* Added by [Alexander Guschin](https://github.com/Rag0n) in Pull Request [#68](https://github.com/layoutBox/FlexLayout/pull/68) 

## [1.3.4](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.3)
Released on 2018-03-05

Fix retain cycle

* Now Flex's hosting view is kept using a weak reference.
* Fixed by [Alexey Zinchenko](https://github.com/zintus) in Pull Request [#64](https://github.com/layoutBox/FlexLayout/pull/64) 

## [1.3.3](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.3)
Released on 2018-02-28

Fix Yoga's rounding issues

* Integer truncation of sizes calculated by sizeThatFits:, and utility functions. Introduced by Obj-C -> Obj-C++ conversion in previous PR
* Low coordinate rounding threshold, which results in flooring apparently valid values. Layout becomes very wrong with absolute coordinate values larger than 100 and having pointScaleFactor set to 3.
* Fixed by [Alexey Zinchenko](https://github.com/zintus) in Pull Request [#63](https://github.com/layoutBox/FlexLayout/pull/63) 

## [1.3.2](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.2)
Released on 2018-02-27

Update Yoga core to latest master

* Yoga core updated to facebook/yoga@295d111
* Yoga core tests and their buck configuration added, see core-tests folder
* Add buck tests to CI config
* Added by [Alexey Zinchenko](https://github.com/zintus) in Pull Request [#62](https://github.com/layoutBox/FlexLayout/pull/62) 


## [1.3.1](https://github.com/layoutBox/FlexLayout/releases/tag/1.3.1)
Released on 2018-02-23

Integrates Yoga's sources into FlexLayout

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#61](https://github.com/layoutBox/FlexLayout/pull/61) 


## [1.2.2](https://github.com/layoutBox/FlexLayout/releases/tag/1.2.2)
Released on 2017-12-20

Add margins methods taking percentage parameters:

* **`marginTop(_ percent: FPercent)`**  
	Top margin specify the offset the top edge of the item should have from it’s closest sibling (item) or parent (container).
* **`marginLeft(_ percent: FPercent)`**  
	Left margin specify the offset the left edge of the item should have from it’s closest sibling (item) or parent (container).
* **`marginBottom(_ percent: FPercent)`**  
	Bottom margin specify the offset the bottom edge of the item should have from it’s closest sibling (item) or parent (container)
* **`marginRight(_ percent: FPercent)`**  
	Right margin specify the offset the right edge of the item should have from it’s closest sibling (item) or parent (container).
* **`marginStart(_ percent: FPercent)`**  
	Set the start margin. In LTR direction, start margin specify the **left** margin. In RTL direction, start margin specify the **right** margin.
* **`marginEnd(_ percent: FPercent)`**  
	Set the end margin. In LTR direction, end margin specify the **right** margin. In RTL direction, end margin specify the **left** margin.
* **`marginHorizontal(_ percent: FPercent)`**  
	Set the left, right, start and end margins to the specified value.
* **`marginVertical(_ percent: FPercent)`**  
	Set the top and bottom margins to the specified value.
	
	###### Usage examples:
	```swift
	  view.flex.margin(20%)
	  view.flex.marginTop(20%).marginLeft(20%)
	  view.flex.marginHorizontal(10%)
	```
  
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#49](https://github.com/layoutBox/FlexLayout/pull/49) 



## [1.2.1](https://github.com/layoutBox/FlexLayout/releases/tag/1.2.1)
Released on 2017-11-23

Update Carthage support  


## [1.2.0](https://github.com/layoutBox/FlexLayout/releases/tag/1.2.0)
Released on 2017-11-23

Many properties can be reset to their initial state. Specifying `nil` when calling these properties reset their value:

* `width(nil)`
* `height(nil)`
* `size(nil)`
* `minWidth(nil)`
* `maxWidth(nil)`
* `minHeight(nil)`
* `maxHeight(nil)`
* `aspectRatio(nil)`
	
FlexLayout now integrates YogaKit source code, this was needed to improve efficiently the iOS's yoga interface.
  
* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#40](https://github.com/layoutBox/FlexLayout/pull/40) 


## [1.1.8](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.8)
Released on 2017-11-23

AspectRatio can now be reset. Simply call `aspectRatio(nil)`.
  
* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#39](https://github.com/layoutBox/FlexLayout/pull/39) 

## [1.1.4](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.4)
Released on 2017-10-31

Add new margin methods:
* `margin(_ insets: UIEdgeInsets)`: Set all margins using UIEdgeInsets.
     This method is particularly useful to set all margins using iOS 11 `UIView.safeAreaInsets`
* `margin(_ directionalInsets: NSDirectionalEdgeInsets)`: Set margins using NSDirectionalEdgeInsets.
     This method is particularly to set all margins using iOS 11 `UIView.directionalLayoutMargins`

Add new padding methods:
* `padding(_ insets: UIEdgeInsets)`: Set all paddings using UIEdgeInsets.
     This method is particularly useful using iOS 11 `UIView.safeAreaInsets`
* `padding(_ directionalInsets: NSDirectionalEdgeInsets)`: Set paddings using NSDirectionalEdgeInsets.
     This method is particularly useful to set all paddings using iOS 11 `UIView.directionalLayoutMargins`

* Update all examples to support iPhone X landscape orientation.

* Add an example of UICollectionView using FlexLayout

* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#33](https://github.com/layoutBox/FlexLayout/pull/33) 


## [1.1.4](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.4)
Released on 2017-10-17

* Add width/height methods taking percentage parameter
	* width(_ percent: FPercent)
	* height(_ percent: FPercent)
	* minWidth(_ percent: FPercent)
	* maxWidth(_ percent: FPercent)
	* minHeight(_ percent: FPercent)
	* maxHeight(_ percent: FPercent)
	
	Usage examples:
	
	* view.flex.width(50%)
	* view.flex.height(25%)
	
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#28](https://github.com/layoutBox/FlexLayout/pull/28) 


## [1.1.3](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.3)
Released on 2017-10-02

* Add Carthage support
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#25](https://github.com/layoutBox/FlexLayout/pull/25) 


## [1.1.0](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.0)
Released on 2017-08-23

* Add missing markDirty() method
* :warning: BREAKING CHANGE: Renamed the method `addContainer()` to `addItem(). It is clearer that the added view is in fact a flex item, and not just a flex container.
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#8](https://github.com/layoutBox/FlexLayout/pull/8 ) 
* Add an implementation of the Ray Wenderlich Yoga Tutorial  
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#7](https://github.com/layoutBox/FlexLayout/pull/7) 
* Add Swift 4.0 support  

## [1.0.0](https://github.com/layoutBox/FlexLayout/releases/tag/1.0.0)
Released on 2017-08-20

* Initial official release.
* Add unit tests 

## [0.1.1](https://github.com/layoutBox/FlexLayout/releases/tag/0.1.1)
Released on 2017-08-02

* Initial beta release.
