//
//  JuiceMaker - EditViewController.swift
//  Created by Wonbi, woong
//

import UIKit

extension EditViewController: SendDataDelegate {
    func sendStock(_ stock: [Int]) {
        updateStockCount(stock: stock)
    }
}

class EditViewController: UIViewController {
    
    @IBOutlet var fruitCountLabelArray: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        mainViewController.delegate = self
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
