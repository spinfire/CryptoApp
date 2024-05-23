//
//  HomeCryptoCoinTableViewCell.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 21/5/24.
//

import UIKit
import Kingfisher

class HomeCryptoCoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: HomeCryptoCoinViewModel){
        coinImageView.kf.setImage(with: model.imageURL)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        priceLabel.text = model.price
    }    
}
