//
//  DayCell.swift
//  ExpandableRecipe
//
//  Created by Abhinay on 14/03/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

protocol DayCellDelegate:class
{
    func didClickOnExpand(tag:Int)
}

class DayCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgDayRecipe: UIImageView!
    @IBOutlet fileprivate weak var lblDayIndex: UILabel!
    @IBOutlet fileprivate weak var btnExpand: UIButton!
    
    //MARK:- Public Var
    weak var delegate:DayCellDelegate?
    var isExpanded = false{
        didSet{
            var image = UIImage(named:"down")
            
            if isExpanded{
                image = UIImage(named:"up")
            }
            btnExpand .setBackgroundImage(image, for: .normal)
        }
    }
    
    //MARK:- View Life Cycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        let tag = "\(self.tag + 1)"
        imgDayRecipe.image = UIImage(named:tag)
    }

    //MARK:- IBAction
    @IBAction func didClickOnExpand(_ sender: Any)
    {
        self.delegate?.didClickOnExpand(tag: self.tag)
        isExpanded = !isExpanded
    }
    
}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension DayCell
{
    struct Constant {
        static let Identifier = String(describing: DayCell.self)
        static let Height:CGFloat = 185.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}
