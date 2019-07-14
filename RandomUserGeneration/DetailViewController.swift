//
//  DetailViewController.swift
//  RandomUserGeneration
//
//  Created by Thaiveena Parthasarathy on 14/07/2019.
//  Copyright © 2019 Thaiveena Parthasarathy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var LastLabel: UILabel!
    @IBOutlet weak var StreetLabel: UILabel!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var CellLabel: UILabel!
    @IBOutlet weak var UserImageLabel: UIImageView!
    @IBOutlet weak var UserScrollView: UIScrollView!
    
    var resultList : RandomUserDet?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "User Details"
        self.UserScrollView.backgroundColor = .brown
        displayUserDetails()
        // Do any additional setup after loading the view.
    }
    func displayUserDetails()
    {
        let imgURL = URL(string: resultList?.picture.large ?? "avatar")
        let data: Data = try! Data(contentsOf: imgURL!)
        self.UserImageLabel.image = UIImage(data: data)
        self.TitleLabel.text = resultList?.name.title.capitalized
        self.TitleLabel.textColor = .yellow
        self.FirstLabel.text = resultList?.name.first.capitalized
        self.FirstLabel.textColor = .yellow
        self.LastLabel.text = resultList?.name.last.capitalized
        self.LastLabel.textColor = .yellow
        self.StreetLabel.text = resultList?.location.street.capitalized
        self.StreetLabel.textColor = .yellow
        self.CityLabel.text = resultList?.location.city.capitalized
        self.CityLabel.textColor = .yellow
        self.EmailLabel.text = resultList?.email
        self.EmailLabel.textColor = .yellow
        self.PhoneLabel.text = resultList?.phone
        self.PhoneLabel.textColor = .yellow
        self.CellLabel.text = resultList?.cell
        self.CellLabel.textColor = .yellow
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
