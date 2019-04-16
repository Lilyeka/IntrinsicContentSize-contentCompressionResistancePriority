//
//  ViewController.swift
//  IntrinsicContentSize
//
//  Created by Лилия Левина on 16/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textField1 = UITextField()
    var textField2 = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        textField1.isUserInteractionEnabled = true
        textField2.isUserInteractionEnabled = true
        
        textField1.text = "1"
        textField1.backgroundColor = .green
        textField2.text = "2"
        textField2.backgroundColor = .yellow
        
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
        
        let d = ["v1":textField1,"v2":textField2]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-120-[v1]", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:|-120-[v2]", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:|-20-[v1]", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:[v2]-20-|", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:[v1(>=100)]-(>=20)-[v2(>=100)]", metrics: nil, views: d)
            ].flatMap{$0})
        
        let p = textField2.contentCompressionResistancePriority(for: .horizontal)
        textField1.setContentCompressionResistancePriority(p+1, for: .horizontal)
    }


}

