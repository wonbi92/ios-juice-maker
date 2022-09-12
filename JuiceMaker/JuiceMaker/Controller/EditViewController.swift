//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

extension EditViewController: SendDataDelegate {
    func sendStock(_ stock: [Int]) {
        self.stock = stock
    }
}

class EditViewController: UIViewController {
    
    @IBOutlet var fruitCountLabelArray: [UILabel]!
    
    var stock = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockCount(stock: stock)
    }
    
    @IBAction private func tappedApplyButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func updateStockCount(stock: [Int]) {
        var newStock = stock
        
        for fruitCountLabel in fruitCountLabelArray {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
}
