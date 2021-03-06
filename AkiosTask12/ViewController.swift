//
//  ViewController.swift
//  AkiosTask12
//
//  Created by Nekokichi on 2020/08/20.
//  Copyright © 2020 Nekokichi. All rights reserved.
//10000 + 1000(10000 * 1/10)

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var taxExcludedPriceTextField: UITextField!
    @IBOutlet private weak var taxRateTextField: UITextField!
    @IBOutlet private weak var taxIncludedPriceLabel: UILabel!
    
    private let ud = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //UserDefaultに消費税率が保存されてるか
        taxRateTextField.text = (ud.object(forKey: "taxRate") as? String) ?? ""
    }

    @IBAction private func calcTaxIncludedPriceButton(_ sender: Any) {
        //入力値から、税率、税抜金額、税込金額、を算出
        let taxRate          = Double(taxRateTextField.text!) ?? 0
        let taxExcludedPrice = Double(taxExcludedPriceTextField.text!) ?? 0
        let taxIncludedPrice = Int(taxExcludedPrice + (taxExcludedPrice  * (taxRate * 0.01)))
//        let taxIncludedPrice = Int(taxExcludedPrice  * (1.0 + (taxRate / 100)))
        
        //UserDefaultに保存
        ud.set(String(taxRate), forKey: "taxRate")
        //UIlabelに税込金額を表示
        taxIncludedPriceLabel.text = String(taxIncludedPrice)
    }
    
}

