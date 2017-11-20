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
    
    @IBOutlet weak var carCollectionView: UICollectionView!
    
    
    //MARK: -Variables
    
    var cars = ["Audi","Bmw","Benz","Honda","RangeRover","Nissan","suzuki","porche"]
    
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
    }




