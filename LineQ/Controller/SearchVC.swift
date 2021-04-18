//
//  SearchVC.swift
//  LineQ
//
//  Created by Ali Alateiyah on 06/04/2021.
//

import UIKit

class SearchVC: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var searchTextField: UITextField!
	
	private var foundRestaurants: [Restaurant]?
	private var dbRestaurants: [Restaurant]?
    var vc : Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.dataSource = self
		tableView.delegate = self
		
		self.tableView.rowHeight = 55
    }

	override func viewWillAppear(_ animated: Bool) {
		loadData()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBAction func searchTextFieldDidReturn(_ sender: UITextField) {
	}
	
	@IBAction func searchTextFieldDidChange(_ sender: Any) {
		if !searchTextField.text!.isEmpty {
			let filteredRestaurants = foundRestaurants?.filter({ (restaurant) -> Bool in
				if let name = restaurant.name,
				   let searchName = self.searchTextField.text?.lowercased() {
					return name.lowercased().contains(searchName)
				} else {
					return false
				}
			})
			foundRestaurants = filteredRestaurants
			tableView.reloadData()
		} else {
			foundRestaurants = dbRestaurants
			tableView.reloadData()
		}
		
	}
	
	func loadData() {
		foundRestaurants = DataService.instance.searchRestaurant { (restaurants) in
			self.dbRestaurants = restaurants
			self.foundRestaurants = restaurants
			self.tableView.reloadData()
		}
	}

}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return foundRestaurants!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell {
			cell.configureCell(foundRestaurants![indexPath.row])
			cell.selectionStyle = .none
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Clicked on \(foundRestaurants![indexPath.row].name) restaurant")
        vc = foundRestaurants![indexPath.row]
        self.performSegue(withIdentifier: "searchTo", sender: self)


	}
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let vc2 = segue.destination as? RestaurantDetailsVC else{return}
        vc2.restaurant = vc
    }
}
