//
//  HomeVC.swift
//  LineQ
//
//  Created by Ali Alateiyah on 06/04/2021.
//


import UIKit
import Firebase
import FirebaseDatabase
class HomeVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    //let db = Firestore.firestore()
    var cards: [Restaurant] = []
    var ref: DatabaseReference!
    var ResturantName = ""
    var vc : Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        ref = Database.database(url: "https://lineq-c30c3-default-rtdb.europe-west1.firebasedatabase.app").reference()
        tableView.register(UINib(nibName: "ResturantCardUI", bundle: nil), forCellReuseIdentifier: "cardCell")
        loadMessages()
        print("Laoding HOMEVCCCC")
        // Do any additional setup after loading the view.
    }
    
    
    func loadMessages(){
        cards = []
        
    
    
        let ref = Database.database(url: "https://lineq-c30c3-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("restaurants")
            ref.observeSingleEvent(of: .value) { (snapshot) in
                guard let dict = snapshot.value as? [String: Any] else { return }
                
                for (_, value) in dict {
                    guard let value = value as? [String: [String: Any]] else { return }
                    for (_, v) in value {
                        guard let name = v["name"],
                              let category = v["category"],
                              let url = v["url"],
                              let q = v["queue"],
                              let phone = v["phone"],
                              let imageUrl = v["imageUrl"],
                              let description = v["description"]
                              else { return }
                        let card = Restaurant(name: name as! String, category: category as! String, url: url as! String, phone: phone as! String, imageUrl: imageUrl as! String, description: description as! String)
                        self.cards.append(card)
                        DispatchQueue.main.async {
                        self.tableView.reloadData()
                                                   }
                        print(q)
                        
                        
                        
                    }
                }
            }
            
            
        }
            
            
            
        }

        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! ResturantCardUI
        cell.resturantName.text = cards[indexPath.row].name
        cell.category.text = cards[indexPath.row].category
        let u = URL(string: cards[indexPath.row].imageUrl)
        cell.imageU.loadurl(url: u!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked \(cards[indexPath.row].name) on restaurant")
        
        vc = cards[indexPath.row]
        self.performSegue(withIdentifier: "HomeTo", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let vc2 = segue.destination as? RestaurantDetailsVC else{return}
        vc2.restaurant = vc
    }
}


