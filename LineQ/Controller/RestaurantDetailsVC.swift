//
//  RestaurantDetails.swift
//  LineQ
//
//  Created by MohammedAlhajri on 17/04/2021.
//

import UIKit

class RestaurantDetailsVC: UIViewController {
    @IBOutlet weak var RestaurantName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    var restaurant: Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        RestaurantName.text = restaurant.name
        category.text = restaurant.category
        desc.text = restaurant.description
        let u = URL(string: restaurant.imageUrl)
        image.loadurl(url: u!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

