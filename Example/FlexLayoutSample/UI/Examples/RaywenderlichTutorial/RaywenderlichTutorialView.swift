// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Created by Luc Dion on 2017-08-23.

import UIKit
import FlexLayout
import PinLayout

class RayWenderlichTutorialView: BaseView {
    fileprivate let contentView = UIScrollView()
    fileprivate let rootFlexContainer = UIView()
    fileprivate var showSelectedIndex = 0
    
    fileprivate let series: Series

    let episodeImageView = UIImageView()
    let summaryPopularityLabel = UILabel()
    let episodeTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let showsTableView = ExpandedTableView()
    
    init(series: Series) {
        self.series = series
        
        super.init()
        
        backgroundColor = .black
        
        let padding: CGFloat = 8
        let paddingHorizontal: CGFloat = 8.0
        
        // Popularity
        summaryPopularityLabel.text = String(repeating: "★", count: series.showPopularity)
        summaryPopularityLabel.textColor = .red
        
        // Year
        let yearLabel = UILabel()
        yearLabel.text = series.showYear
        yearLabel.textColor = .lightGray
        
        // Rating
        let ratingLabel = UILabel()
        ratingLabel.text = series.showRating
        ratingLabel.textColor = .lightGray

        // Length
        let lengthLabel = UILabel()
        lengthLabel.text = series.showLength
        lengthLabel.textColor = .lightGray
        
        // Episode id
        let episodeIdLabel = showLabelFor(text: series.selectedShow, font: .boldSystemFont(ofSize: 16.0))
        
        // Episode Title
        initLabelFor(episodeTitleLabel, font: .boldSystemFont(ofSize: 16.0))

        // Description
        initLabelFor(descriptionLabel, font: .systemFont(ofSize: 14.0))
        descriptionLabel.numberOfLines = 3
        
        // Cast & creators
        let castLabel = showLabelFor(text: "Cast: \(series.showCast)", font: .boldSystemFont(ofSize: 14.0))
        let creatorsLabel = showLabelFor(text: "Creators: \(series.showCreators)", font: .boldSystemFont(ofSize: 14.0))
        
        let addActionView = showActionViewFor(imageName: "add", text: "My List")
        let shareActionView = showActionViewFor(imageName: "share", text: "Share")
        
        // Tabs
        let episodesTabView = showTabBarFor(text: "EPISODES", selected: true)
        let moreTabView = showTabBarFor(text: "MORE LIKE THIS", selected: false)
        
        // Shows list
        showsTableView.delegate = self
        showsTableView.dataSource = self
        showsTableView.backgroundColor = self.backgroundColor
        showsTableView.register(ShowTableViewCell.self, forCellReuseIdentifier: ShowTableViewCell.reuseIdentifier)
        
        rootFlexContainer.flex.define { (flex) in
            // Image
            flex.addItem(episodeImageView).grow(1).backgroundColor(.gray)
            
            // Summary row
            flex.addItem().direction(.row).padding(padding).define({ (flex) in
                flex.addItem(summaryPopularityLabel).grow(1)
                
                flex.addItem().direction(.row).justifyContent(.spaceBetween).grow(2).define({ (flex) in
                    flex.addItem(yearLabel)
                    flex.addItem(ratingLabel)
                    flex.addItem(lengthLabel)
                })
                
                flex.addItem().width(100).height(1).grow(1)
            })
            
            // Title row
            flex.addItem().direction(.row).padding(padding).define({ (flex) in
                flex.addItem(episodeIdLabel)
                flex.addItem(episodeTitleLabel).marginLeft(20)
            })
            
            // Description section
            flex.addItem().paddingHorizontal(paddingHorizontal).define({ (flex) in
                flex.addItem(descriptionLabel)
                flex.addItem(castLabel)
                flex.addItem(creatorsLabel)
            })
            
            // Action row
            flex.addItem().direction(.row).padding(padding).define({ (flex) in
                flex.addItem(addActionView)
                flex.addItem(shareActionView)
            })
            
            // Tabs row
            flex.addItem().direction(.row).padding(padding).define({ (flex) in
                flex.addItem(episodesTabView)
                flex.addItem(moreTabView)
            })
            
            // Shows TableView
            flex.addItem(showsTableView).grow(1)
        }
        
        contentView.addSubview(rootFlexContainer)
        
        addSubview(contentView)
        
        // Show the first episode
        didSelectShow(show: series.shows[0])
        showsTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // 1) Layout the contentView & rootFlexContainer using PinLayout
        contentView.pin.top().bottom().left().right()
        rootFlexContainer.pin.top().left().right()

        // 2) Let the flexbox container layout itself and adjust the height
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        
        // 3) Adjust the scrollview contentSize
        contentView.contentSize = rootFlexContainer.frame.size
    }
    
    fileprivate func didSelectShow(show: Show) {
        // Episode image
        let image = UIImage(named: show.image)
        let imageAspectRatio = (image?.size.width ?? 1.0) / (image?.size.height ?? 1.0)
        episodeImageView.image = image
        episodeImageView.flex.aspectRatio(imageAspectRatio).markDirty()
        
        episodeTitleLabel.text = show.title
        episodeTitleLabel.flex.markDirty()
        
        descriptionLabel.text = show.detail
        descriptionLabel.flex.markDirty()
        
        // Force a relayout
        setNeedsLayout()
    }
    
    fileprivate func showLabelFor(text: String? = nil, font: UIFont = .systemFont(ofSize: 14.0)) -> UILabel {
        let label = UILabel(frame: .zero)
        initLabelFor(label, text: text, font: font)
        return label
    }
    
    fileprivate func initLabelFor(_ label: UILabel, text: String? = nil, font: UIFont = .systemFont(ofSize: 14.0)) {
        label.font = font
        label.textColor = .lightGray
        label.text = text
        label.flex.marginBottom(5)
    }
    
    fileprivate func showActionViewFor(imageName: String, text: String) -> UIView {
        let actionView = UIView(frame: .zero)
        actionView.flex.alignItems(.center).width(50).marginRight(20.0)

        let actionButton = UIButton(type: .custom)
        actionButton.setImage(UIImage(named: imageName), for: .normal)
        actionButton.flex.padding(10)
        actionView.addSubview(actionButton)
        
        let actionLabel = showLabelFor(text: text)
        actionView.addSubview(actionLabel)
        
        return actionView
    }
    
    fileprivate func showTabBarFor(text: String, selected: Bool) -> UIView {
        let tabView = UIView(frame: .zero)
        tabView.flex.alignItems(.center).marginRight(20)

        let tabLabelFont = selected ? UIFont.boldSystemFont(ofSize: 14.0) : UIFont.systemFont(ofSize: 14.0)
        let fontSize = text.size(attributes: [NSFontAttributeName: tabLabelFont])
        
        let tabSelectionView = UIView(frame: CGRect(x: 0, y: 0, width: fontSize.width, height: 3))
        tabSelectionView.flex.width(fontSize.width).marginBottom(5)
        tabSelectionView.backgroundColor = selected ? .red : .clear
        tabView.addSubview(tabSelectionView)
        
        let tabLabel = showLabelFor(text: text, font: tabLabelFont)
        tabView.addSubview(tabLabel)
        
        return tabView
    }
}

// MARK: - UITableViewDataSource methods
extension RayWenderlichTutorialView: UITableViewDataSource, UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.shows.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.reuseIdentifier, for: indexPath) as! ShowTableViewCell
        cell.configure(show: series.shows[indexPath.row])
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectShow(show: series.shows[indexPath.row])
    }
}
