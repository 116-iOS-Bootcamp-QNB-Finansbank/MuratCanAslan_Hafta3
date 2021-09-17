//
//  SliderCell.swift
//  BannerSlider
//
//  Created by Samet Bugra Oktay on 15.09.2021.
//

import UIKit

struct SliderCellViewModel {
    let image: UIImage?
    let text: String
}

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    
    func configure(with model: SliderCellViewModel) {
        imageView.image = model.image
        textLabel.text = model.text
    }
    
}
