//
//  ViewController.swift
//  ATFoundation
//
//  Created by TimeToThink on 09/11/2017.
//  Copyright (c) 2017 TimeToThink. All rights reserved.
//

import UIKit
import ATFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate
{
    let clickBlock:(_ a:Int)->() = {(_ a) in
        logN("执行了 Block   "+a.description)
    }
    lazy var modelArray:[Model] = {
        
        var models : [Model] = []
        for i in 0..<20
        {
            var model = Model()
            model.name = "Celestial Ruler Supreme God "
            model.age = 20 + i
            model.gender = " male"
            models.append(model)
        }
        return models
    }()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initTableView()
    }
    func initTableView(){
        
        let ScreenHeight = UIScreen.main.bounds.size.height
        let tableView = UITableView.init(frame:CGRect(x: 0, y: 64, width: 375, height: ScreenHeight-64), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(DemoCell.classForCoder(), forCellReuseIdentifier: "identifier")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.modelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "identifier"
        let cell:DemoCell? = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DemoCell
        cell?.model = self.modelArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickBlock(indexPath.row)
        logN("my kkk is kkkkk".howMany(str: ""))
    }
}
