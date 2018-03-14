//
//  TimeCell.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 14/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class TimeCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var lblRecipeTime: UILabel!
    @IBOutlet fileprivate weak var imgRecipeForTime: UIImageView!
    @IBOutlet fileprivate weak var lblRecipeName: UILabel!
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension TimeCell
{
    struct Constant {
        static let Identifier = String(describing: TimeCell.self)
        static let Height:CGFloat = 155.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

