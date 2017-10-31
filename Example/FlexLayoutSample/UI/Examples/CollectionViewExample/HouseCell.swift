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
// Created by Luc Dion on 2017-10-31.

import UIKit
import FlexLayout

class HouseCell: UICollectionViewCell {
    static let reuseIdentifier = "HouseCell"
    fileprivate let nameLabel = UILabel()
    fileprivate let mainImage = UIImageView()
    fileprivate let priceLabel = UILabel()
    fileprivate let distanceLabel = UILabel()
    
    fileprivate let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let footerBackgroundColor = UIColor.flexLayoutColor.withAlphaComponent(0.2)
        backgroundColor = .white
    
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.textColor = .white

        mainImage.backgroundColor = .black
        mainImage.contentMode = .scaleAspectFill
        
        distanceLabel.textAlignment = .right
        
        contentView.flex.padding(padding).define { (flex) in
            flex.addItem().backgroundColor(.flexLayoutColor).paddingHorizontal(padding).define({ (flex) in
                flex.addItem(nameLabel).grow(1)
            })
            
            flex.addItem(mainImage).height(300)
            
            flex.addItem().direction(.row).justifyContent(.spaceBetween).padding(6, padding, 6, padding).backgroundColor(footerBackgroundColor)
                .define({ (flex) in
                flex.addItem(priceLabel)
                flex.addItem(distanceLabel).grow(1)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(house: House) {
        nameLabel.text = house.name
        nameLabel.flex.markDirty()
        
        mainImage.download(url: house.mainImageURL)
        
        priceLabel.text = house.price
        priceLabel.flex.markDirty()
        
        distanceLabel.text = "\(house.distance) KM"
        distanceLabel.flex.markDirty()
        
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size
    }
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
}
