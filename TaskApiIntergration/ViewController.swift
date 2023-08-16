//
//  ViewController.swift
//  TaskApiIntergration
//
//  Created by Ananth Nair on 09/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var json : [Root]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAvatarURl()
        
    }
    
    func getDataFromAvatarURl(){
        let url = URL(string :"https://api.github.com/users/hadley/orgs")
        let task = URLSession.shared.dataTask(with: url!){
            (data,response,error) in
            do {
                let content = try?JSONDecoder().decode([Root].self, from: data!)
                self.json = content
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
            catch {
                print(error)
            }

        }
        task.resume()
        
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
                let vc = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if let imgg = json?[indexPath.row].avatar_url {
                    let url = URL(string: (imgg))
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url!)
                        DispatchQueue.main.async {
                            vc.img1.image = UIImage(data: data!)
                        }
                    }
        
                } else {
                    vc.img1.image = #imageLiteral(resourceName: "NoImgICon")
                }
        
        
                return vc
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return json?.count ?? 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        print("cellForRowAt")
//        let vc = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        if let imgg = json?[indexPath.row].img {
//            let url = URL(string: (imgg))
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: url!)
//                DispatchQueue.main.async {
//                    vc.img1.image = UIImage(data: data!)
//                }
//            }
//
//        } else {
//            vc.img1.image = #imageLiteral(resourceName: "NoImgICon")
//        }
//
//
//        return vc
//    }
    
    
    
    
    
    
    
    
}

