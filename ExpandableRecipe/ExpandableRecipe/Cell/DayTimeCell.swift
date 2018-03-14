//
//  DayTimeCell.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 14/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class DayTimeCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetting()
    }

    //MARK:- Private Methods
    fileprivate func initialSetting()
    {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        
        TimeCell.registerNib(tableView: tableView)
    }
    
    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension DayTimeCell
{
    struct Constant {
        static let Identifier = String(describing: DayTimeCell.self)
        static let Height:CGFloat = 455.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

extension DayTimeCell: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeCell.Constant.Identifier) as! TimeCell
        return cell
    }
    
}

extension DayTimeCell: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TimeCell.Constant.Height
    }
}
