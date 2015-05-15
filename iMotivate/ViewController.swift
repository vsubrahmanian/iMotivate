//
//  ViewController.swift
//  iMotivate
//
//  Created by Vijay Subrahmanian on 15/05/15.
//  Copyright (c) 2015 Vijay Subrahmanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let filePath: String = NSBundle.mainBundle().pathForResource("Thoughts", ofType: "plist")!
        let thoughts: NSArray = NSArray(contentsOfFile: filePath)!
        let numberOfThoughts = UInt32(thoughts.count)
        // Generate a random number within the number of thoughts.
        let randomThoughtNumber = arc4random_uniform(numberOfThoughts)
        // Set the thought for today.
        let randomThought = thoughts.objectAtIndex(Int(randomThoughtNumber)) as! String
        self.quoteTextView.text = randomThought
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

