//
//  ViewController.swift
//  CrossOverAssignment
//
//  Created by Pranay on 6/4/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,URLSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.request()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func  request(){
    
        if let url = NSURL(string: "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php") {
            
            let session = URLSession(
                configuration: URLSessionConfiguration.ephemeral,
                delegate: self,
                delegateQueue: nil)
            
            var request = URLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            
            let paramString = "data=Hello"
            request.httpBody = paramString.data(using: String.Encoding.utf8)
            
        
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
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
    
    func keychainStore()  {
        
//        let MyKeychainWrapper = KeychainWrapper();
//        MyKeychainWrapper.mySetObject(passwordTextField.text, forKey:kSecValueData)
//        MyKeychainWrapper.writeToKeychain()
//        
//        MyKeychainWrapper.myObjectForKey("v_Data") as? String
        
    }
    
    func saveInDB() {
        
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return;
        }
        
        let managedContext = appdelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person",in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue("reddy", forKey: "name")
        person.setValue(123, forKey: "nationalID")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func fetchData() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        //3
        do {
           _ = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

