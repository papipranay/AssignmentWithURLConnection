//
//  ViewController.swift
//  CrossOverAssignment
//
//  Created by Pranay on 6/4/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.request()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func  request(){
    
        if let url = NSURL(string: "https://localhost:3443/api/v2.0/") {
            
            let session = URLSession(
                configuration: URLSessionConfiguration.ephemeral,
                delegate: RequestResponse(),
                delegateQueue: nil)
            
            let task = session.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print("error:")
                } else if data != nil {
                    if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                        print("Received data:\n\(str)")
                    }
                    else {
                        print("Unable to convert data to text")
                    }
                }
            })
            
            task.resume()
        }
        else {
            print("Unable to create NSURL")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

