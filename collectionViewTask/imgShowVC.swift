//
//  imgShowVC.swift
//  collectionViewTask
//
//  Created by Rabeeh KP on 21/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class imgShowVC: UIViewController {
var uDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imgData = uDefault.object(forKey: "image") as? NSData
        {
            if let image = UIImage(data: imgData as Data)
            {
                self.imgShow.image = image
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -Outlets
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var imgShow: UIImageView!
    //MARK: -Acton
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        
        dismiss(animated: false, completion: nil)
    }
}
