//
//  ViewController.swift
//  SqLite3Swift
//
//  Created by MAC OS on 6/16/17.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtid: UITextField!
    
    @IBOutlet weak var txtfn: UITextField!
    
    @IBOutlet weak var txtct: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnselect(_ sender: Any) {
        
        let str = "select * from student";
        let obj = dbclass();
        let arr = obj.getdata(query: str);
        print(arr);
    }

    @IBAction func btninsert(_ sender: Any) {
        
        let ss1 = "insert into student(s_id,f_name,city)values(\(txtid.text!),'\(txtfn.text!)','\(txtct.text!)')";
        
        print(ss1);
        
        
        let obj = dbclass();
        
        let  ss = obj.dmloperation(query: ss1);
        
        if ss == true {
            
            print("recored inserted");
        }
        else
        {
            print("not insertd");            
        }
    }

}

