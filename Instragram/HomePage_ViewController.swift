//
//  HomePage_ViewController.swift
//  Instragram
//
//  Created by Rifluxyss on 17/02/23.
//

import UIKit

class HomePage_ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate, UITableViewDataSource {
   
    var var_name = ["Travel", "Adventure", "Steve","Instragram",]
    var var_image:[UIImage] = [#imageLiteral(resourceName: "Travel"),#imageLiteral(resourceName: "Travel"),#imageLiteral(resourceName: "Adventure"),#imageLiteral(resourceName: "Profile_Icon")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomePage_CV.delegate = self
        HomePage_CV.dataSource = self
        HomePg_TBV.delegate = self
        HomePg_TBV.dataSource = self
    }
    
    //Collectionview
    @IBOutlet weak var HomePage_CV: UICollectionView!
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return var_image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row <= 0){
            let cell = HomePage_CV.dequeueReusableCell(withReuseIdentifier: "Intragram_Story_1", for: indexPath)
            return cell
        }
        let cell = HomePage_CV.dequeueReusableCell(withReuseIdentifier: "Intragram_Story_2", for: indexPath) as! HomePage_CV_Cell
        cell.InstagraStory_Image.image = var_image[indexPath.row]
        cell.layer.cornerRadius = 55
        cell.layer.borderWidth = 3
        cell.layer.borderColor =  UIColor.green.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = (HomePage_CV.frame.size.height)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ProfilePg_Story") as! ProfilePage_ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 
    
    //TableView
    @IBOutlet weak var HomePg_TBV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return var_image.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomePg_TBV.dequeueReusableCell(withIdentifier: "HP_TBV_Cell", for: indexPath) as! HomePg_TB_Cell
        cell.Top_Proflie_Name.text = var_name[indexPath.row]
        cell.Top_Image.image = var_image[indexPath.row]
        cell.Top_Image.clipsToBounds = true
        cell.Post_Image.image = var_image[indexPath.row]
        cell.Button.tag = indexPath.row
        cell.Button.addTarget(self, action: #selector(Image_Button(_:)), for: UIControl.Event.touchUpInside)
        return cell
    }

//Blur_View
    @IBOutlet weak var Blur_View: UIView!
    @IBOutlet var PopUP_View: UIView!
    @IBOutlet weak var PopUp_Image: UIImageView!
    
    @IBAction func Image_Button(_ sender:UIButton) {
        Blur_View.bounds = view.bounds
        view.addSubview(Blur_View)
        let index = sender.tag
        PopUP_View.center.x = view.center.x
        PopUP_View.center.y = view.center.y
        UIView.animate(withDuration: 1) {
            self.view.addSubview(self.PopUP_View)
            self.PopUp_Image.image = self.var_image[index]
     }
    }

    @IBAction func BlurImage_Button(_ sender: UIButton) {
        PopUP_View.removeFromSuperview()
        Blur_View.removeFromSuperview()
    }
    
    //Comment_Page
    @IBAction func Comment_Page(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Comment_Page")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //Share_Button
    @IBOutlet var Share_View: UIView!
    var Share_Tap = false
    @IBAction func Share_Button(_ sender: UIButton) {
        if Share_Tap == false{
            sender.setBackgroundImage(#imageLiteral(resourceName: "send"), for: UIControl.State.normal)
            view.addSubview(Share_View)
            Share_View.center.x = view.center.x
            Share_View.center.y = view.center.y + 300
            Share_Tap = true
        }
        else{
            sender.setBackgroundImage(#imageLiteral(resourceName: "Message"), for: UIControl.State.normal)
            Share_View.removeFromSuperview()
            Share_Tap = false
        }
    }
    
}
