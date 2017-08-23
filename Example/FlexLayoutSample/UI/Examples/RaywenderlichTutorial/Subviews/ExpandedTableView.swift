//
//  File.swift
//  FlexLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-08-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

// TableView that the method sizeThatFits() returns the size of all its cells.
// Support only cells with fixed height
class ExpandedTableView: UITableView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let nbOfCells = numberOfRows(inSection: 0)
        let cellsHeight = delegate?.tableView?(self, heightForRowAt: IndexPath(row: 0, section: 0)) ?? 0
        return CGSize(width: size.width, height: CGFloat(nbOfCells) * cellsHeight)
    }
}
