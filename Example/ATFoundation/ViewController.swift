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
        print("执行了 Block   "+a.description)
    }
    lazy var modelArray:NSMutableArray = {
        
        let models = NSMutableArray()
        for i in 0..<20
        {
            let model = Model()
            model.name = "吾乃天帝 "
            model.age = 20 + i
            model.gender = " 男"
            models.addObject(Object: model)
        }
        return models
    }()
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        initTableView()
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
        cell?.model = self.modelArray.objectAtIndex(Index: indexPath.row) as! Model!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickBlock(100)
        var number = 10
        test(&number) { (_ a) in
            print("打印 函数 block " + "\(a)")
            return a
        }
    }
    
    func test(_ a:inout Int,block:(_ num:Int)->(Int)){
        a += block(a)
        print("result is " + "\(a)")
    }
    
    
    
}

























