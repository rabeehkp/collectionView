//
//  ViewController.swift
//  collectionViewTask
//
//  Created by Rabeeh KP on 20/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: -Outlets
    
    @IBOutlet weak var scrollButton: UIButton!
    @IBOutlet weak var carCollectionView: UICollectionView!
    
    
    //MARK: -Variables
    
    var cars = ["Audi","Bmw","Benz","Honda","RangeRover","Nissan","Suzuki","Porche","Toyota"]
    var uDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -Delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = carCollectionView.dequeueReusableCell(withReuseIdentifier: "newCell", for: indexPath) as! imgAndtxtCVcell
    cell.collectionImg.image = UIImage(named:cars[indexPath.row])
    cell.collectionLabel.text = cars[indexPath.row]
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var imgData = UIImageJPEGRepresentation(UIImage(named: cars[indexPath.row])!, 1)
        let show = uDefault.set(imgData, forKey: "image")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let ShowViewController = storyBoard.instantiateViewController(withIdentifier: "imgShowVC") as! imgShowVC
        self.present(ShowViewController, animated:true, completion:nil)
    }
    //MARK: -Action
    
    @IBAction func scrollButton(_ sender: UIButton) {
    
        
    }
    
    }




