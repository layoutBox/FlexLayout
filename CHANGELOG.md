<p align="center">
	<img src="docs_markdown/images/flexlayout-logo-2.png" alt="FlexLayout and PinLayout Performance" width=100/>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">FlexLayout</h1>


# Change Log

## [1.1.4](https://github.com/lucdion/FlexLayout/releases/tag/1.1.4)
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
	
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#28](https://github.com/lucdion/FlexLayout/pull/28) 


## [1.1.3](https://github.com/lucdion/FlexLayout/releases/tag/1.1.3)
Released on 2017-10-02

* Add Carthage support
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#25](https://github.com/lucdion/FlexLayout/pull/25) 


## [1.1.0](https://github.com/lucdion/FlexLayout/releases/tag/1.1.0)
Released on 2017-08-23

* Add missing markDirty() method
* :warning: BREAKING CHANGE: Renamed the method `addContainer()` to `addItem(). It is clearer that the added view is in fact a flex item, and not just a flex container.
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#8](https://github.com/lucdion/FlexLayout/pull/8 ) 
* Add an implementation of the Ray Wenderlich Yoga Tutorial  
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#7](https://github.com/lucdion/FlexLayout/pull/7) 
* Add Swift 4.0 support  

## [1.0.0](https://github.com/lucdion/FlexLayout/releases/tag/1.0.0)
Released on 2017-08-20

* Initial official release.
* Add unit tests 

## [0.1.1](https://github.com/lucdion/FlexLayout/releases/tag/0.1.1)
Released on 2017-08-02

* Initial beta release.