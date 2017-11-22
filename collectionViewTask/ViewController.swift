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
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var newView: UIView!
    
    //MARK: -Variables
    var position: CGPoint!
    var lastContentOffset: CGFloat = 0
    var cars = ["Audi","Bmw","Benz","Honda","RangeRover","Nissan","Suzuki","Porche","Toyota","Terrano","Hyundai","Bugatti","Xuv500","Jaguar","Chevrolet","Jeep","Lexus","Volvo"]
    var uDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        newView.layer.cornerRadius = 33
        
        
        // position = scrollButton.center
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:  -DataSource methods
    //No of Section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //no of Row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    // cellCreation
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carCollectionView.dequeueReusableCell(withReuseIdentifier: "newCell", for: indexPath) as! imgAndtxtCVcell
        cell.collectionImg.image = UIImage(named:cars[indexPath.row])
        cell.collectionLabel.text = cars[indexPath.row]
        return cell
    }
    
    //MARK: -Delegates
    //CollectionView didSelect
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imgData = UIImageJPEGRepresentation(UIImage(named: cars[indexPath.row])!, 1)
        uDefault.set(imgData, forKey: "image")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if  let ShowViewController = storyBoard.instantiateViewController(withIdentifier: "imgShowVC") as?imgShowVC
        {
            self.present(ShowViewController, animated:true, completion:nil)
        }
    }
    //MARK: -View Methords
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ( self.lastContentOffset < scrollView.contentOffset.y )  {
            // scroll to bottom
            UIView.animate(withDuration: 0.3,delay:0 ,options:[.curveEaseInOut], animations: {
                //code for scaling: self.newView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.newView.transform = CGAffineTransform(translationX: 0, y: 140)
                //self.scrollButton.transform = CGAffineTransform(rotationAngle: self.radians(_degrees: 90))
            }, completion:{ _ in
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.newView.transform = .identity
            }) { (true) in
            }
        }
        //
        let  height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom == height {
            UIView.animate(withDuration: 0.3, animations: {
                self.newView.transform = .identity
            }, completion: { (true) in
            })
        }
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if( scrollView.contentOffset.y <=  (scrollView.contentSize.height - scrollView.contentSize.height)  ) {
            //you reached end of the table
            UIView.animate(withDuration: 0.5, animations: {
                self.newView.transform = .identity
            }) { (true) in
            }
        }
    }
    
    //MARK: -Functions
    //to convert degree
    func radians(_degrees: Double) -> CGFloat
    {
        return CGFloat(_degrees *  .pi / _degrees)
    }
    
    //MARK: -Action
    @IBAction func scrollButton(_ sender: UIButton) {
        //
    }
}





