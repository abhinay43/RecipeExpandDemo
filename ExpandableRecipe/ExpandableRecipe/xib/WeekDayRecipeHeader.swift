//
//  WeekDayRecipeHeader.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 18/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

protocol WeekDayRecipeHeaderDelegate:class{
    func didClickOnArrow(index:Int)
}

class WeekDayRecipeHeader: UITableViewHeaderFooterView
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgDayRecipe: UIImageView!
    @IBOutlet fileprivate weak var lblDayIndex: UILabel!
    @IBOutlet fileprivate weak var btnExpand: UIButton!
    
    //MARK:- Public Var
    weak var delegate:WeekDayRecipeHeaderDelegate?
    
    //MARK:- IBAction
    @IBAction fileprivate func didClickOnArrow()
    {
        delegate?.didClickOnArrow(index: self.tag)
    }

}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension WeekDayRecipeHeader
{
    struct Constant {
        static let Identifier = String(describing: WeekDayRecipeHeader.self)
        static let Height:CGFloat = 185.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}
