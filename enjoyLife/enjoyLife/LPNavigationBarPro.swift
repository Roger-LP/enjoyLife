
//
//  LPNavigationBarPro.swift
//  Hexun
//
//  Created by 罗平 on 16/10/8.
//  Copyright © 2016年 罗平. All rights reserved.
//

import UIKit
enum Position {
    case left
    case right
}
protocol LPNavigationBarPro:NSObjectProtocol{
    func addBg(image:UIImage?)
    func addTitle(str:String?)
    func addBtn(position:Position,btnImage:String,action: Selector,title:String)
}
extension LPNavigationBarPro where Self:UIViewController{
    func addTitle(str:String?){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        label.text = str
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(25)
        navigationItem.titleView = label
    }
    func addBtn(position:Position,btnImage:String,action: Selector,title:String){
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btn.backgroundColor = UIColor(patternImage: UIImage(named: btnImage)!)
        btn.setTitle(title, forState: .Normal)
        btn.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        let  babtn = UIBarButtonItem(customView: btn)
        if position == .left{
            
            navigationItem.leftBarButtonItem = babtn
        }else{
            
            navigationItem.rightBarButtonItem = babtn
        }
    }
    func addBg(image:UIImage?) {
        navigationController?.navigationBar.setBackgroundImage(image!.stretchableImageWithLeftCapWidth(10, topCapHeight: 10), forBarMetrics: .Default)
    }
}