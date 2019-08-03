<p align="center">
	<img src="docs_markdown/images/flexlayout-logo-2.png" alt="FlexLayout and PinLayout Performance" width=100/>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">FlexLayout</h1>


# Change Log

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