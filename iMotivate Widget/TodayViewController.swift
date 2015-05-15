//
//  TodayViewController.swift
//  iMotivate Widget
//
//  Created by Vijay Subrahmanian on 15/05/15.
//  Copyright (c) 2015 Vijay Subrahmanian. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var randomThought: String = "What man actually needs is not a tensionless state but rather the striving and struggling for some goal worthy of him. What he needs is not the discharge of tension at any cost, but the call of a potential meaning waiting to be fulfilled by him. -Viktor Frankl"
    
    @IBOutlet weak var quoteTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let filePath: String = NSBundle.mainBundle().pathForResource("Thoughts", ofType: "plist")!
        let thoughts: NSArray = NSArray(contentsOfFile: filePath)!
        let numberOfThoughts = UInt32(thoughts.count)
        // Generate a random number within the number of thoughts.
        let randomThoughtNumber = arc4random_uniform(numberOfThoughts)
        // Set the thought for today.
        self.randomThought = thoughts.objectAtIndex(Int(randomThoughtNumber)) as! String
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.quoteTextLabel.text = self.randomThought
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func launchiMotivateApp(sender: UIButton) {
        // User tapped on the widget. Open the application using the specified URL Scheme.
        let appURL = NSURL(string: "iMotivate://")
        self.extensionContext?.openURL(appURL!, completionHandler:nil)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        // Implement this method and return the edge insets if you want to use custom edge insets.
        return UIEdgeInsets(top: 1.0, left: 3.0, bottom: 1.0, right: 3.0)
    }
    
}
