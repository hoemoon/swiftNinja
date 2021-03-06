//
//  ViewController.swift
//  MyVending
//
//  Created by hoemoon on 20/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine()
    
    @IBOutlet weak var cokeCount: UILabel!
    @IBOutlet weak var cidarCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.drawView), name: NSNotification.Name("added"), object: nil)
        let notification:Notification = Notification(name: Notification.Name("any"), object: nil, userInfo: vendingMachine.getStockDict())
        drawView(notification: notification)
        
        let coke = Soda(name: "cokek")
        let coke2 = Soda(name: "coke")
        print(coke == coke2)
    }
    
    func drawView(notification:Notification) {
        let stocks = notification.userInfo!
        if let coke = stocks["cocacola"] {
            cokeCount.text = String(describing: coke)
        }
        if let cidar = stocks["cidar"] {
            cidarCount.text = String(describing: cidar)
        }
    }
    
    func getStocks() -> [String: Int] {
        return vendingMachine.getStockDict()
    }
    
    func setStocks(stocks: [String: Int]) {
        vendingMachine.setStock(stored: stocks)
    }
    
    func setUnarchive(unarchived: [String:[Beverage]]) {
        vendingMachine.setUnarchvied(unarchived: unarchived)
    }
    
    func getStocksForArchive() -> [String:[Beverage]] {
        return vendingMachine.getStocksForArchive()
    }
    
    func getMachine() -> VendingMachine {
        return vendingMachine
    }
    
    func setMachine(machine: VendingMachine) {
        vendingMachine = machine
    }
    
    @IBAction func addCoke(_ sender: Any) {
        let coke = Soda(maker: "cocacola inc.", price: 1000, name: "cocacola", expireDate: Date(), caffein: false, acidLevel: 50)
        vendingMachine.add(beverage: coke)
    }

    @IBAction func addCidar(_ sender: Any) {
        let cidar = Soda(maker: "lotte", price: 1000, name: "cidar", expireDate: Date(), caffein: false, acidLevel: 40)
        vendingMachine.add(beverage: cidar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

