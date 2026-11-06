import FlexLayout
import Testing
import UIKit

@MainActor
struct TextTruncationTests {
    @Test
    func layoutPreservesLabelWidthAfterIntrinsicMeasurement() {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 44))
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Balance"
        descriptionLabel.font = .systemFont(ofSize: 17)
        let amountLabel = UILabel()
        amountLabel.text = "$36.50"
        amountLabel.font = .systemFont(ofSize: 17)

        container.flex.addItem().direction(.row).justifyContent(.spaceBetween).define { flex in
            flex.addItem(descriptionLabel)
            flex.addItem().addItem(amountLabel)
        }

        _ = container.flex.intrinsicSize
        container.flex.layout()

        #expect(amountLabel.frame.width >= amountLabel.intrinsicContentSize.width)
    }
}
