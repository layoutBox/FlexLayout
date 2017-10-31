//
//  UIImageView+Load.swift
//  FlexLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-10-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
