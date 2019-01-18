//
//  dbclass.swift
//  SqLite3Swift
//
//  Created by MAC OS on 6/16/17.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class dbclass: NSObject {

    func dmloperation(query:String) -> Bool {
        
        var status:Bool = false;
        
        let dbpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let strdbpath =  dbpath.strings(byAppendingPaths: ["emp.db"])[0] ;
        print(strdbpath);
        var db: OpaquePointer? = nil;
        if sqlite3_open(strdbpath, &db)==SQLITE_OK
        {
            var statement :OpaquePointer? = nil;
            
            if sqlite3_prepare_v2(db, query, -1, &statement, nil)==SQLITE_OK
            {
                sqlite3_step(statement);
                status = true;
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
        return status;
    }
    
    func getdata(query:String) -> [String]
    {
        var arrdata :[String]=[];
        var status:Bool = false;
        
        let dbpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        var strdbpath = dbpath.strings(byAppendingPaths: ["emp.db"])[0];
        var db: OpaquePointer? = nil;
        if sqlite3_open(strdbpath, &db)==SQLITE_OK
        {
            var statement :OpaquePointer? = nil;
            if sqlite3_prepare_v2(db, query, -1, &statement, nil)==SQLITE_OK
            {
                while sqlite3_step(statement)==SQLITE_ROW
                {
                    let emp_id = String(cString: sqlite3_column_text(statement, 0))
                    let emp_name = String(cString: sqlite3_column_text(statement, 1))
                    
                    let emp_add = String(cString: sqlite3_column_text(statement, 2))
                    arrdata.append(emp_id);
                    arrdata.append(emp_name);
                    arrdata.append(emp_add);
                }
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
        return arrdata;
    }
}
