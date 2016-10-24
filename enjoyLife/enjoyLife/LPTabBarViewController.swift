import UIKit

class LPTBViewController: UITabBarController {
    static let shareTabbar = LPTBViewController()
    var view1:UIView!
    var imageName :[String] = ["tab_icon_home_30x30_","tab_icon_explore_30x30_","tab_icon_store_30x30_"]
    var labelName:[String] = ["首页","寻觅","精品"]
    var imageAfterName :[String] = ["tab_icon_home_highlight_30x30_","tab_icon_explore_highlight_30x30_","tab_icon_store_highlight_30x30_"]
    let ctrNameArray = ["MainViewController","FindViewController","ShopViewController"]
    var imageView:UIImageView!
    var label:UILabel!
    var selected :[Bool] = [false,false,false,false,false]
    var imageArr:[UIImageView] = []
    var labelArr :[UILabel] = []
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.hidden = true
        createTabbar()
        configUI()
        
    }
    func createTabbar() {
        var ctrlArray = [UINavigationController]()
        for i in 0..<ctrNameArray.count{
            let ctrl = NSClassFromString("enjoyLife.\(ctrNameArray[i])") as! UIViewController.Type
            let vc = ctrl.init()
            let navCtrl = UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        viewControllers = ctrlArray

    }
    func configUI(){
        
        tabBar.hidden = true
        view1 = UIView(frame: CGRect(x: 0, y: height-49, width: width, height: 49))
        view1.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(view1)
        let wh = (width/3-30)/2
        for i in 0...2{
            imageView = UIImageView(frame: CGRect(x: wh + CGFloat(i)*width/3, y: 5, width: 30, height: 30))
            imageView.image = UIImage(named: imageName[i])
            imageView.contentMode = .ScaleAspectFill
            imageView.userInteractionEnabled = true
            imageArr.append(imageView)
            view1.addSubview(imageView)
            imageView.tag = i
            let tap = UITapGestureRecognizer(target: self, action: #selector(btnClick(_:)))
            imageView.addGestureRecognizer(tap)
            label = UILabel(frame: CGRect(x: CGFloat(i)*width/3, y: 35, width: width/3, height: 9))
            label.text = labelName[i]
            label.textColor = UIColor.grayColor()
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(10)
            label.tag = i
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(btnClick(_:)))
            label.addGestureRecognizer(tap1)
            labelArr.append(label)
            label.userInteractionEnabled = true
            view1.addSubview(label)
        }
        imageArr[0].image = UIImage(named: imageAfterName[0])
        labelArr[0].textColor = UIColor(red: 55/255.0, green: 172/255.0, blue: 134/255.0, alpha: 1.0)
        view.addSubview(view1)
    }
    func btnClick(tap:UIGestureRecognizer) {
        let t = tap.view?.tag
        self.selectedIndex = t!
        selected[t!] = true
        for i in 0...2{
        
            if selected[i]{
                labelArr[t!].textColor = UIColor(red: 55/255.0, green: 172/255.0, blue: 134/255.0, alpha: 1.0)
                imageArr[t!].image = UIImage(named: imageAfterName[t!])
                selected[t!] = false
            }else{
                labelArr[i].textColor = UIColor.lightGrayColor()
                imageArr[i].image = UIImage(named: imageName[i])
            }
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
