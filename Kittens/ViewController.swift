//
//  ViewController.swift
//  Kittens
//
//  Created by Kenneth Debruyn on 31/12/16.
//  Copyright © 2016 kN3TT3R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var addKittenTF: UITextField!
    @IBOutlet weak var myKittensTV: UITextView!
    @IBOutlet weak var removeKittenB: UIButton!


    // MARK: - Global variables & Constants
    var myKittens = [String]()
    let kittensAvailableTitle = "Make a pal happy with the eldest kitten"
    let noKittensAvailableTitle = "No kittens available"
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        myKittensTV.text = "My kittens: \n"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - IBActions
    @IBAction func addKittenButton(_ sender: UIButton) {
        if !(addKittenTF.text?.isEmpty)! {
            enableRemoveKittenB()
            updateMyKittens(sender: sender)
            updateMyKittensTextView()
            emptyAddKittenTF()
        }
    }
    
    @IBAction func removeKittenButton(_ sender: UIButton) {
        updateMyKittens(sender: sender)
        updateMyKittensTextView()
    }
    
    
    // MARK: - Homemade Functions
    func updateMyKittens(sender: UIButton) {
        if sender.tag == 1 {
            myKittens.append(addKittenTF.text!)
        }
        if sender.tag == 2 {
            myKittens.removeFirst()
        }
    }
    
    func updateMyKittensTextView() {
        myKittensTV.text = "My kittens: \n"
        for myKitten in myKittens {
            myKittensTV.text.append(myKitten)
            myKittensTV.text.append("\n")
        }
        renameRemoveKittenB()
    }
    
    func renameRemoveKittenB() {
        if myKittens.isEmpty {
            removeKittenB.setTitle(noKittensAvailableTitle, for: .normal)
            disableRemoveKittenB()
        }
        else {
            removeKittenB.setTitle(kittensAvailableTitle, for: .normal)
        }
    }
    
    func emptyAddKittenTF() {
        addKittenTF.text = ""
        addKittenTF.resignFirstResponder()
    }
    
    func enableRemoveKittenB() {
        removeKittenB.isEnabled = true
    }
    
    func disableRemoveKittenB() {
        removeKittenB.isEnabled = false
    }

}

