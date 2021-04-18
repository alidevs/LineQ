//
//  ResturantCardUI.swift
//  LineQ
//
//  Created by MohammedAlhajri on 02/09/1442 AH.
//

import UIKit

class ResturantCardUI: UITableViewCell {

    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var imageU: UIImageView!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var cardDetail: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        card.layer.cornerRadius = card.frame.height / 10
        imageU.layer.cornerRadius = imageU.frame.height / 10
        cardDetail.layer.cornerRadius = cardDetail.frame.height / 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    func loadurl(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
