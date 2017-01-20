//
//  NetWorking.swift
//  BossClientiOS
//
//  Created by seastar on 2017/1/19.
//  Copyright © 2017年 seastar. All rights reserved.
//

import UIKit

class NetWorking: NSObject{

    static let current = NetWorking();
    
    func post(dic:[String:Any],urlStr:String){
        
        let postData = try? JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted);
        let url = URL(string: urlStr);
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request.timeoutInterval = 15;
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        request.httpBody = postData;
        
        let session = URLSession.shared;
        let task = session.dataTask(with: request) { (data, response, error) in
            print(data ?? NSData());
            print(response ?? URLResponse());
            print(error ?? Error.self);
        };
        task.resume();
        
    }
    
    
    
    
}
