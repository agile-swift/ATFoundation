//
//  DemoCell.swift
//  ATFoundation
//
//  Created by Spider on 17/9/18.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {

    private let label = UILabel()
    internal var model:Model = Model(){
        didSet {
            self.label.text = self.model.name + model.age.description + model.gender
//            print(self.label.text ?? "默认")
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.model = Model()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpUI() {
        
        self.label.frame = CGRect.init(x: 20, y: 15, width: 200, height: 20)
        self.label.font = UIFont.boldSystemFont(ofSize: 14)
        self.contentView.addSubview(self.label)
    }
}
