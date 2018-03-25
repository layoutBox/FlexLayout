<p align="center">
	<img src="images/flexlayout-logo-2.png" alt="FlexLayout and PinLayout Performance" width=100/>
</p>


<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">FlexLayout Benchmark</h1>

## Methodology  <a name="methodology"></a>

### Layout Framework Benchmark
FlexLayout and [PinLayout](https://github.com/mirego/PinLayout) performance has been benchmarked using [Layout Framework Benchmark](https://github.com/layoutBox/LayoutFrameworkBenchmark). 

The benchmark includes the following layout frameworks:

* Auto layout
* [FlexLayout](https://github.com/layoutBox/FlexLayout)
* [LayoutKit](https://github.com/linkedin/LayoutKit)
* Manual layout (i.e. set UIView's frame directly)
* [PinLayout](https://github.com/mirego/PinLayout)
* UIStackViews

<br>

### Benchmark details
The benchmark layout UICollectionView and UITableView cells in multiple pass, each pass contains more cells than the previous one. 

<br>

### Benchmark Results

As you can see in the following chart, PinLayout are faster or equal to manual layouting, and **between 8x and 12x faster than auto layout**, and this for all types of iPhone (5S/6/6S/7/8/X)

The benchmark layout UICollectionView and UITableView cells in multiple pass, each pass contains more cells than the previous one. 

<img src="benchmark/benchmark_comparison_all.png" alt="PinLayout Performance"/></a>

See [Layout Framework Benchmark](https://github.com/layoutBox/LayoutFrameworkBenchmark) for complete details and benchmarks charts for iPhone X/8/7/6S/...

<br>


### FlexLayout benchmark source code

[FlexLayout benchmark's source code](https://github.com/layoutBox/LayoutFrameworkBenchmark/blob/master/LayoutFrameworkBenchmark/Benchmarks/FlexLayout/FeedItemFlexLayoutView.swift)

```swift
flex.addItem(contentView).padding(8).define { (flex) in
    flex.addItem(contentView).padding(8).define { (flex) in
        flex.addItem().direction(.row).justifyContent(.spaceBetween).define { (flex) in
            flex.addItem(actionLabel)
            flex.addItem(optionsLabel)
        }
        
        flex.addItem().direction(.row).alignItems(.center).define({ (flex) in
            flex.addItem(posterImageView).width(50).height(50).marginRight(8)

            flex.addItem().grow(1).define({ (flex) in
                flex.addItem(posterNameLabel)
                flex.addItem(posterHeadlineLabel)
                flex.addItem(posterTimeLabel)
            })
        })

        flex.addItem(posterCommentLabel)

        flex.addItem(contentImageView).aspectRatio(350 / 200)
        flex.addItem(contentTitleLabel)
        flex.addItem(contentDomainLabel)

        flex.addItem().direction(.row).justifyContent(.spaceBetween).marginTop(4).define({ (flex) in
            flex.addItem(likeLabel)
            flex.addItem(commentLabel)
            flex.addItem(shareLabel)
        })

        flex.addItem().direction(.row).marginTop(2).define({ (flex) in
            flex.addItem(actorImageView).width(50).height(50).marginRight(8)
            flex.addItem(actorCommentLabel).grow(1)
        })
    }
}
```

<br>
