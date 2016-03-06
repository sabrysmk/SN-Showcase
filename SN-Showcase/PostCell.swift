//
//  PostCell.swift
//  SN-Showcase
//
//  Created by Александр Сабри on 25/02/16.
//  Copyright © 2016 Александр Сабри. All rights reserved.
//

import UIKit
import Alamofire

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var appImg: UIImageView!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var request: Request?
    
    private var _post: Post?
    
    var post: Post? {
        return _post
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func drawRect(rect: CGRect) {
        userImg.layer.cornerRadius = userImg.frame.size.width / 2
        userImg.clipsToBounds = true
        appImg.clipsToBounds = true
        likeImg.layer.cornerRadius = likeImg.frame.size.width / 2
        likeImg.clipsToBounds = true
    }
    
    func configureCell(post: Post, img: UIImage?) {
        
        //Clear existing image (because its old)
        self.appImg.image = nil
        self._post = post
        
        if let desc = post.postDescription where post.postDescription != "" {
            self.descriptionText.text = desc
        } else {
            self.descriptionText.hidden = true
        }
        
        self.likesLbl.text = "\(post.likes)"
        
        if post.imageUrl != nil {
            //Use the cached image if there is one, otherwise download the image
            if img != nil {
                appImg.image = img!
            } else {
                //Must store the request so we can cancel it later if this cell is now out of the users view
                request = Alamofire.request(.GET, post.imageUrl!).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, err in
                    
                    if err == nil {
                        let img = UIImage(data: data!)!
                        self.appImg.image = img
                        FeedVC.imageCache.setObject(img, forKey: self.post!.imageUrl!)
                    }
                })
            }
            
        } else {
            self.appImg.hidden = true
        }
        
        
        //can't set user image yet because we dont have user images set up yet
        
        
    }
    
}