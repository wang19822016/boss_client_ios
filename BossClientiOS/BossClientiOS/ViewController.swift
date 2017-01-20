//
//  ViewController.swift
//  BossClientiOS
//
//  Created by seastar on 2017/1/19.
//  Copyright © 2017年 seastar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func click(_ sender: Any) {
        activate();
    }
    
    func activate(){
        let time:String = String(serverTime);
        let url = serverUrl + "/user/install";
        let dic = ["appId":"",
                   "deviceId":"ss",
                   "deviceType":"iOS",
                   "country":"china",
                   "serverTime":time
        ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func register(){
        let time:String = String(serverTime);
        let url = serverUrl + "/user/register";
        let dic = ["appId":"",
                   "userId":"",
                   "deviceId":"ss",
                   "deviceType":"iOS",
                   "country":"china",
                   "serverTime":time
        ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func login(){
        let time:String = String(serverTime);
        let url = serverUrl + "/user/login";
        let dic = ["appId":"",
                   "userId":"ss",
                   "serverTime":time
        ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func pay(){
        let time:String = String(serverTime);
        let url = serverUrl + "/user/pay";
        let dic = ["appId":"",
                   "userId":"ss",
                   "payMoney":"ss",
                   "serverTime":time
        ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func online(){
        let time:String = String(serverTime);
        let url = serverUrl + "/user/online";
        let dic = ["appId":"",
                   "userId":"ss",
                   "serverTime":time
        ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(Thread.current);
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //startTimer();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopTimer();
    }
    
    var seastarTimer = Timer();
    
    var serverTime:Int = 0;
    
    let serverUrl:String = "";
    //启动定时器
    func startTimer(){
        self.seastarTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.postData), userInfo: nil, repeats: true);
        serverTime += 5;
    }
    
    //永久关闭定时器
    func stopTimer(){
        seastarTimer.invalidate();
    }
    
    //暂停定时器
    func lockTimer(){
        seastarTimer.fireDate = NSDate.distantPast;
    }
    
    //开启定时器
    func unlockTimer(){
        seastarTimer.fireDate = NSDate.distantFuture;
        
    }
    
    func postData(){
        DispatchQueue.global().async {
            print(Thread.current);
        }
    }
}

