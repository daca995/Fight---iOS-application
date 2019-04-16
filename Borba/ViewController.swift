//  ViewController.swift
//  Borba
//  Created by KTIOS2 on 10/18/18.
//  Copyright © 2018 Cim. All rights reserved.
//
import UIKit

class ViewController: UIViewController, SingeSelectDelegate {
    
    //IZVRSAVA SE NA POCETKU KADA SE POKRENE PROGRAM 
    //@IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstFighterImage: UIImageView!
    @IBOutlet weak var secondFighterImage: UIImageView!
    @IBOutlet weak var firstFighterLabel: UILabel!
    @IBOutlet weak var secondFighterLabel: UILabel!
    @IBOutlet weak var fightButton: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    let fightController = FightController()
    
    var arr1 : [Soldier] = []
    var arr2 : [Soldier] = []
    
    var fighter1 : Soldier? {
        didSet{
            guard let fighter1Un = fighter1 else { self.secondFighterLabel.text = "Fighter1"        //da se svaki put setuje ime "Fighter1" kad izaberemo borca
                return }

            self.firstFighterLabel.text = fighter1Un.name
            self.firstFighterImage.image = UIImage(named:fighter1Un.pictureName )
        }
    }
    var fighter2 : Soldier? {
        didSet{
            guard let fighter2Un = fighter2 else { self.secondFighterLabel.text = "Fighter2"
                return }

            self.secondFighterLabel.text = fighter2Un.name
            self.secondFighterImage.image = UIImage(named:fighter2Un.pictureName )
        }
    }
    
    //button.setTitle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after   loading the view, typically from a nib.
        //self.nextButton.setTitle("Next", for: .normal)
        //var string : String? = "Pera"
        // print(
        //var human = Human.init(name: "Aleksandar", surname: "Marko", city: "Sabac", healthPoints: 78, isAlive: true, pictureName: "profilna")
        //human.city = "Novi Sad"
        //human.healthPoints = 77
        //human.healthPoints -= 1
        //var person = Person.init(firstName: "Petar", lastName: "Petrovic")
        //print(person.fullName)
        //person.fullName = "Milan Markovic"
        
        let mac = Sword.init()
        let stit = Shield.init()
        _ = Human.init(name: "Milan", surname: "Topalov", city: "Zrenjanin")
        let soldier1 = Soldier.init(name: "Luka" , surname: "Lukic", city: "Sombor")
        _ = Soldier.init(name: "Marko" , surname: "Markovic", city: "Beograd")
        let knight1 = Knight.init(name: "Janko", surname: "Jankovic", city: "Subotica", sword:  mac)
        let knight2 = Knight.init(name: "Savo", surname: "Savkovic", city: "Loznica", sword: nil)
        let knight3 = Knight.init(name: "Petar", surname: "Petrovic", city: "Kikinda", sword: mac)
        let knight4 = Knight.init(name: "Jovan", surname: "Jovanovic", city: "Sabac", sword: mac)
        let commander1 = Commander.init(name: "Daniela", surname: "Kotur", city: "Dubica", sword: mac, shield: stit)
        let commander2 = Commander.init(name: "Ljiljana", surname: "Popovic", city: "Loznica", sword: mac, shield: stit)
        let commander3 = Commander.init(name: "Ivana", surname: "Stojanovic", city: "Petrovac", sword: nil, shield: stit)
        let commander4 = Commander.init(name: "Nikola", surname: "Gavric", city: "Kamenica", sword: mac, shield: nil)
        let commander5 = Commander.init(name: "Ivan", surname: "Beljic", city: "Bogatic", sword: nil, shield: nil)
        
        arr1 = [soldier1, knight1, commander1, knight2, commander3, knight4]
        arr2 = [knight2, knight3, commander2, commander4, commander5]
        
        firstFighterImage.isUserInteractionEnabled = true
        secondFighterImage.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(firstImageTapped))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(secondImageTapped))
        firstFighterImage.addGestureRecognizer(tapGesture1)
        secondFighterImage.addGestureRecognizer(tapGesture2)
        
        self.firstFighterLabel.text = "Fighter1"     //da se svaki put setuje ime "Fighter1"  i pre nego sto izaberemo borca
        self.secondFighterLabel.text = "Fighter2"
        
        self.fightButton.setTitle("Let's  F I G H T !", for: .normal)
        winnerLabel.text = " "
        
       // var b1 = (arc4random_uniform(UInt32(UInt(arr1.count))))
       // var b2 = (arc4random_uniform(UInt32(UInt(arr2.count))))
       /* fightController.fight(firstFighter:arr1[Int(b1)], secondFighter: arr2[Int(b2)])*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()     // Dispose of any resources that can be recreated.
    }

    @IBAction func fightAction(_ sender: UIButton) {
        if let fighter1Un = fighter1, let fighter2Un = fighter2 {
            let winner : Fighter = fightController.fight(firstFighter:fighter1Un, secondFighter: fighter2Un)
            self.winnerLabel.text = "The winner is \(winner.name).  Congratulation!"
        } else {
            let alert = UIAlertController(title: "Error occured!", message: " \n Please choose Fighter1 and Fighter2.", preferredStyle: .alert)    //ako nismo izabrali borca da iskoci
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))                                                             //poruka da moramo to da uradimo
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func firstImageTapped(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SingleSelectViewController") as! SingleSelectViewController
        vc.delegate = self
        vc.arr = arr1
        vc.groupType = .group1
        self.navigationController?.pushViewController(vc, animated: true)
    
        /* let b1 = (arc4random_uniform(UInt32(UInt(arr1.count))))
         fighter1 = arr1[Int(b1)]*/
    }
    
    @objc func secondImageTapped(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SingleSelectViewController") as! SingleSelectViewController
        vc.delegate = self
        vc.arr = arr2
        vc.groupType = .group2

        self.navigationController?.pushViewController(vc, animated: true)
        
        /*let b2 = (arc4random_uniform(UInt32(UInt(arr2.count))))
        fighter2 = arr2[Int(b2)]*/
    }
    
    func selectedIndex(_ index: Int, type: GroupType) {
        
        if type == .group1{
             fighter1 = arr1[index]
        }else{
            fighter2 = arr2[index]
        }
        
    }
    
}


