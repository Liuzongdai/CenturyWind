//
//  MainTableViewController.swift
//  CenturyWind_
//
//  Created by 刘宗岱 on 16/2/19.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

   
        
        
        let kCloseCellHeight: CGFloat = 100 // equal or greater foregroundView height
        let kOpenCellHeight: CGFloat = 300
        
        var cellHeights = [CGFloat]()
        let kRowsCount = 10
        
        override func viewDidLoad() {
            super.viewDidLoad()
            for _ in 0...kRowsCount {
                cellHeights.append(kCloseCellHeight)
            }
            
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            
            if cell is FoldingCell {
                let foldingCell = cell as! FoldingCell
                foldingCell.backgroundColor = UIColor.clearColor()
                
                if cellHeights[indexPath.row] == kCloseCellHeight {
                    foldingCell.selectedAnimation(false, animated: false, completion:nil)
                } else {
                    foldingCell.selectedAnimation(true, animated: false, completion: nil)
                }
            }
        }
        
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
            
            if cell.isAnimating() {
                return
            }
            
            var duration = 0.0
            if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
                cellHeights[indexPath.row] = kOpenCellHeight
                cell.selectedAnimation(true, animated: true, completion: nil)
                duration = 0.5
            } else {// close cell
                cellHeights[indexPath.row] = kCloseCellHeight
                cell.selectedAnimation(false, animated: true, completion: nil)
                duration = 1.1
            }
            
            UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
                tableView.beginUpdates()
                tableView.endUpdates()
                }, completion: nil)
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return cellHeights[indexPath.row]
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath)
            
            return cell
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        
    }
    


