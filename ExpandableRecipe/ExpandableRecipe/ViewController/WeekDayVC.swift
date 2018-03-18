//
//  WeekDayVC.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 18/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class WeekDayVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    //MARK:- Private vars
    fileprivate var lastSelectedIndexPath:IndexPath?
    fileprivate var selectedIndexPath:IndexPath?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DayTimeCell.registerNib(tableView: self.tableView)
        
        tableView.register(UINib(nibName: WeekDayRecipeHeader.Constant.Identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: WeekDayRecipeHeader.Constant.Identifier)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension WeekDayVC
{
    struct Storyboard {
        static let Identifier = String(describing: WeekDayVC.self)
    }
    
}
extension WeekDayVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if selectedIndexPath?.section == section{
            return 1
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayTimeCell.Constant.Identifier) as! DayTimeCell
        cell.tag = indexPath.row
        return cell
    }
    
}

extension WeekDayVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeekDayRecipeHeader.Constant.Identifier) as! WeekDayRecipeHeader
        headerView.tag = section
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WeekDayRecipeHeader.Constant.Height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DayTimeCell.Constant.Height
    }
}

extension WeekDayVC:WeekDayRecipeHeaderDelegate
{
    func didClickOnArrow(index: Int)
    {
        let indexPath = IndexPath(row: 0, section: index)
        
        if selectedIndexPath == indexPath
        {
            selectedIndexPath = nil
            self.deleteRowAtIndexPath(indexPath: indexPath)
            return
        }
        else{
            if let selectedIndexPath = self.selectedIndexPath{
                self.selectedIndexPath = nil
                self.deleteRowAtIndexPath(indexPath: selectedIndexPath)
            }
            
            selectedIndexPath = indexPath
            self.addRowAtIndexPath(indexPath: indexPath)
            return
        }
        
        
        
        
    }
    
    func addRowAtIndexPath(indexPath:IndexPath)
    {
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
    }
    
    func deleteRowAtIndexPath(indexPath:IndexPath)
    {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .top)
        tableView.endUpdates()
    }
}
