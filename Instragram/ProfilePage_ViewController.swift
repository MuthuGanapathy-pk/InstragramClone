//
//  ProfilePage_ViewController.swift
//  Instragram
//
//  Created by Rifluxyss on 20/02/23.
//

import UIKit

class ProfilePage_ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var Profile_Image: UIImageView!
    @IBOutlet weak var User_Name: UILabel!
    
    @IBOutlet weak var ProfilePg_CV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfilePg_CV.delegate = self
        ProfilePg_CV.dataSource = self
        ProfilePg_CV.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    //CollectionView
    var var_name = ["Travel", "Adventure", "Steve","Instragram"]
    var var_image:[UIImage] = [#imageLiteral(resourceName: "Travel"),#imageLiteral(resourceName: "Adventure"),#imageLiteral(resourceName: "Profile_Icon"),#imageLiteral(resourceName: "InstraIcon")]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return var_image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ProfilePg_CV.dequeueReusableCell(withReuseIdentifier: "ProfilePg_CV_Cell", for: indexPath) as! ProfilePage_CV_Cell
        cell.ProfilePg_CV_Image.image = var_image[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = (ProfilePg_CV.frame.size.width-10)/2
        return CGSize(width: size, height: size)
    }
    
    //LogOut
    @IBAction func LogOut_Button(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "LogIn_Page")
        self.navigationController?.setViewControllers([vc!], animated: true)
    }
}
