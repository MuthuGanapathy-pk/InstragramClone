//
//  HomePg_TB_Cell.swift
//  Instragram
//
//  Created by Rifluxyss on 20/02/23.
//

import UIKit

class HomePg_TB_Cell: UITableViewCell {
   
    @IBOutlet weak var Top_Image: UIImageView!
    @IBOutlet weak var Top_Proflie_Name: UILabel!
    @IBOutlet weak var Post_Image: UIImageView!
    @IBOutlet weak var Button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Like_Button
    var Like_Tap = false
    
    @IBOutlet weak var No_Of_Like: UILabel!
    @IBAction func Like_Button(_ sender: UIButton) {
        
        if Like_Tap == false{
            sender.setBackgroundImage(#imageLiteral(resourceName: "RedHeart"), for: UIControl.State.normal)
            Like_Tap = true
            No_Of_Like.text = "1"
        }
        else{
            sender.setBackgroundImage(#imageLiteral(resourceName: "Like"), for: UIControl.State.normal)
            Like_Tap = false
            No_Of_Like.text = "0"
        }
    }
    
}
