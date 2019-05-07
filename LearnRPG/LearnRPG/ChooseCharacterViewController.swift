//
//  ChooseCharacterViewController.swift
//  LearnRPG
//
//  Created by g on 4/28/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import UIKit

class ChooseCharacterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    
    @IBAction func selectCharTapAction(_ sender: Any) {
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            print(indexPath.item)
        }
    }
    
    let characters = ["Elf","Fairy","Lil' Knight","Merchant","Orc","Warrior"]
    let characterImages: [UIImage] = [
        UIImage(named: "elf1")!,
        UIImage(named: "fairy1")!,
        UIImage(named: "knight4")!,
        UIImage(named: "shopkeeper1")!,
        UIImage(named: "orc1")!,
        UIImage(named: "warrior1")!
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCollectionViewCell
        cell.characterNameLabel.text = characters[indexPath.item]
        cell.characterImageView.image = characterImages[indexPath.item]
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {//works!
        
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            print("Got clicked on index: \(index)!")
            print(index.item)
            GlobalVariables.sharedManager.setClassId(newClassId: index.item)
        }
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        

        // Do any additional setup after loading the view.
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
