<p align="center">
	<img src="docs_markdown/images/flexlayout-logo-2.png" alt="FlexLayout and PinLayout Performance" width=100/>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">FlexLayout</h1>


# Change Log

## [1.1.8](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.8)
Released on 2017-11-23

* AspectRatio can now be reset. Simply call `aspectRatio(nil)`.
  
* Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#39](https://github.com/layoutBox/FlexLayout/pull/39) 

## [1.1.4](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.4)
Released on 2017-10-31

* Add new margin methods:
  * `margin(_ insets: UIEdgeInsets)`: Set all margins using UIEdgeInsets.
     This method is particularly useful to set all margins using iOS 11 `UIView.safeAreaInsets`
  * `margin(_ directionalInsets: NSDirectionalEdgeInsets)`: Set margins using NSDirectionalEdgeInsets.
     This method is particularly to set all margins using iOS 11 `UIView.directionalLayoutMargins`

* Add new padding methods:
  * `padding(_ insets: UIEdgeInsets)`: Set all paddings using UIEdgeInsets.
     This method is particularly useful using iOS 11 `UIView.safeAreaInsets`
  * `padding(_ directionalInsets: NSDirectionalEdgeInsets)`: Set paddings using NSDirectionalEdgeInsets.
     This method is particularly useful to set all paddings using iOS 11 `UIView.directionalLayoutMargins`

* Update all examples to support iPhone X landscape orientation.

* Add an example of UICollectionView using FlexLayout

* Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#33](https://github.com/layoutBox/FlexLayout/pull/33) 


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
	
	* Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#28](https://github.com/layoutBox/FlexLayout/pull/28) 


## [1.1.3](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.3)
Released on 2017-10-02

* Add Carthage support
  * Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#25](https://github.com/layoutBox/FlexLayout/pull/25) 


## [1.1.0](https://github.com/layoutBox/FlexLayout/releases/tag/1.1.0)
Released on 2017-08-23

* Add missing markDirty() method
* :warning: BREAKING CHANGE: Renamed the method `addContainer()` to `addItem(). It is clearer that the added view is in fact a flex item, and not just a flex container.
  * Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#8](https://github.com/layoutBox/FlexLayout/pull/8 ) 
* Add an implementation of the Ray Wenderlich Yoga Tutorial  
  * Added by [Luc Dion](https://github.com/layoutBox) in Pull Request [#7](https://github.com/layoutBox/FlexLayout/pull/7) 
* Add Swift 4.0 support  

## [1.0.0](https://github.com/layoutBox/FlexLayout/releases/tag/1.0.0)
Released on 2017-08-20

* Initial official release.
* Add unit tests 

## [0.1.1](https://github.com/layoutBox/FlexLayout/releases/tag/0.1.1)
Released on 2017-08-02

* Initial beta release.