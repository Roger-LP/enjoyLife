//
//  FindViewController.swift
//  enjoyLife
//
//  Created by 罗平 on 2016/10/24.
//  Copyright © 2016年 罗平. All rights reserved.
//

import UIKit
import SnapKit
class MainViewController: UIViewController,LPNavigationBarPro{
    var search:UITextField?
    //保存约束用的
    var topConstraint:Constraint?
    var widthConstraint:Constraint?
    var rightConstraint:Constraint?
    var grayView:UIView?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        view.backgroundColor = UIColor.whiteColor()
    }
    func configUI() {
        addTitle("首页")
        addBg(UIImage(named: "navBg"))
        search = UITextField()
        search!.placeholder = "请输入店面和地址"
        let searchView = UIImageView()
        searchView.image = UIImage(named: "zdsearch")
        searchView.frame = CGRect(x: 20, y: 12, width: 26, height: 25)
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view1.addSubview(searchView)
        search!.leftView = view1
        search!.leftViewMode = .Always
        search!.background = UIImage(named: "searchdi")
        search!.delegate = self
        view.addSubview(search!)
        search!.snp_makeConstraints { (make) in
            make.left.equalTo(view.snp_left).offset(10)
            topConstraint = make.top.equalToSuperview().offset(5).constraint
            make.height.equalTo(50)
            widthConstraint = make.width.equalTo(width-30).constraint
            rightConstraint = make.right.equalTo(view.snp_right).offset(-20).constraint
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
extension MainViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        navigationController?.navigationBarHidden = true
        self.topConstraint?.uninstall()
        rightConstraint?.uninstall()
        widthConstraint?.uninstall()
        search?.snp_updateConstraints(closure: { (make) in
            make.left.equalTo(view.snp_left).offset(10)
            make.top.equalToSuperview().offset(35)
            make.right.equalTo(view.snp_right).offset(-80)
        })
       let btn = UIButton()
        btn.setTitle("取消", forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(btn)
        btn.snp_makeConstraints { (make) in
            make.centerY.equalTo((search?.snp_centerY)!)
            make.height.equalTo((search?.snp_height)!)
            make.right.equalTo(view.snp_right).offset(0)
            
            make.width.equalTo(80)
        }
        grayView = UIView(frame: CGRect(x: 0, y: 95, width: width, height: height-60))
        grayView!.backgroundColor = UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        view.addSubview(grayView!)
        return true
    }
    func btnClick(btn:UIButton) {
        navigationController?.navigationBarHidden = false
        btn.removeFromSuperview()
        grayView?.removeFromSuperview()
        rightConstraint?.uninstall()
        widthConstraint?.uninstall()
        search?.snp_updateConstraints(closure: { (make) in
            make.left.equalTo(view.snp_left).offset(10)
            make.top.equalToSuperview().offset(5)
            make.right.equalTo(view.snp_right).offset(-20)
        })
        
        search!.resignFirstResponder()
    }
}
