//
//  ViewController.swift
//  RandomUserGeneration
//
//  Created by Thaiveena Parthasarathy on 14/07/2019.
//  Copyright © 2019 Thaiveena Parthasarathy. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var results : UserBase?
    var userArray : [RandomUserDet]?
    var nameDetails : Name?
    var locationDetails: Location?
    var pictureUrlDet : Picture?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users List"
        fetchUsers()
    }

    func fetchUsers(){
        var req = URLRequest(url: URL(string: "https://randomuser.me/api/?results=50&seed=THAIVEENA")!)
        req.httpMethod="GET"
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            do{
                let jsondecoder = JSONDecoder()
                let results = try jsondecoder.decode(UserBase.self, from: data!)
                self.userArray = (results.results)!
                self.tableView.reloadData()
                
            }
            catch let error{
                print("JSON error",error)
            }
            }.resume()
    }
}

func formatName(userName: Name) -> String
{
    return userName.title.capitalized + " "+userName.first.capitalized
}

extension JsonViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "user") as? RandomUserTableViewCell else
        {
            return UITableViewCell()
        }
        
        if let user = userArray?[indexPath.row]
        {
            let fullName = formatName(userName:user.name)
            cell.Title.text=fullName
            cell.Title.textColor = .brown
            cell.SubTitle.text=user.email
            
            if (indexPath.row % 2 == 0)
            {
                cell.SubTitle.textColor = .yellow
            }
            else
            {
                cell.SubTitle.textColor = .black
            }
            let imgURL = URL(string: user.picture.large)
            let data: Data = try! Data(contentsOf: imgURL!)
            cell.UserImage.image = UIImage(data: data)
            cell.UserImage.layer.borderColor = UIColor.black.cgColor
            cell.UserImage.layer.cornerRadius = cell.UserImage.frame.height/2
            cell.UserImage.clipsToBounds = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.lightGray
        } else
        {
            cell.backgroundColor = UIColor.white
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let indexpath = userArray?[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailsVC.resultList = indexpath
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
