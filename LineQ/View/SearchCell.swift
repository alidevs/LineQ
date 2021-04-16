//
//  SearchCell.swift
//  LineQ
//
//  Created by Ali Alateiyah on 15/04/2021.
//

import UIKit

class SearchCell: UITableViewCell {
	
	// Outlets
	@IBOutlet var restaurantName: UILabel!
	@IBOutlet var restaurantCategory: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		
        // Configure the view for the selected state
    }
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15))
	}
	
	func configureCell(_ restaurant: Restaurant) {
		let name = restaurant.name ?? "N/A"
		let category = restaurant.category ?? "N/A"
		
		restaurantName.text = name
		restaurantCategory.text = category
	}

}
