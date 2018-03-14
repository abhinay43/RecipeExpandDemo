//
//  ViewController.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 14/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit
import YNExpandableCell

class ViewController: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var tableView: YNTableView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initialSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-
    fileprivate func initialSetting()
    {
        let cells = ["DayCell","DayTimeCell"]
        
        self.tableView.registerCellsWith(nibNames: cells, and: cells)
        
        self.tableView.registerCellsWith(cells: [UITableViewCell.self as AnyClass], and: ["YNNonExpandableCell"])
        
        self.tableView.ynDelegate = self
        self.tableView.ynTableViewRowAnimation = .top
        
    }

}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension ViewController
{
    struct Constant {
        static let Identifier = String(describing: ViewController.self)
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

//MARK:- ExpandCellDelegate

extension ViewController:YNTableViewDelegate
{
    func tableView(_ tableView: YNTableView, expandCellWithHeightAt indexPath: IndexPath) -> YNTableViewCell?
    {
        let dayTimeCell = YNTableViewCell()
        dayTimeCell.cell = tableView.dequeueReusableCell(withIdentifier: DayTimeCell.Constant.Identifier) as! DayTimeCell
        dayTimeCell.height = DayTimeCell.Constant.Height
        return dayTimeCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let dayCell = tableView.dequeueReusableCell(withIdentifier: DayCell.Constant.Identifier) as! DayCell
        let tag = indexPath.row
        dayCell.tag = tag
        dayCell.delegate = self
        return dayCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DayCell.Constant.Height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
}

//MARK:- Extension

extension ViewController:DayCellDelegate
{
    func didClickOnExpand(tag: Int)
    {
        
    }
}




