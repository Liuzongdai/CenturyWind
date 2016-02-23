//
//  LeftViewController.swift
//  CenturyWind_
//
//  Created by 刘宗岱 on 16/2/18.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit
import ITRAirSideMenu

class LeftViewController: UIViewController,ITRAirSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func click(sender: AnyObject) {
        let itrSideMenu = ((UIApplication.sharedApplication().delegate) as! AppDelegate).itrAirSideMenu
        itrSideMenu.hideMenuViewController()
    }

    func sideMenu(sideMenu: ITRAirSideMenu!, didHideMenuViewController menuViewController: UIViewController!) {
        sideMenu.setContentViewController(UINavigationController(rootViewController:UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController")), animated: true)
        
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
