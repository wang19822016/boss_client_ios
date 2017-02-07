//
//  ViewController.swift
//  BossClientiOS
//
//  Created by seastar on 2017/1/19.
//  Copyright © 2017年 seastar. All rights reserved.
//

import UIKit
import AppsFlyerLib


class ViewController: UIViewController {
    
    
    @IBAction func active(_ sender: Any) {
        test()
    }
    
    @IBAction func register(_ sender: Any) {
        register()
    }
    
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    @IBAction func pay(_ sender: Any) {
        pay()
    }
    
    func activate(){
        let time = getTime();
        let url = serverUrl + "/device/install";
        let dic = [ "api":"device/install",
                    "appId":"11",
                    "deviceId":"iOS555555555",
                    "deviceType":"iOS",
                    "country":"china",
                    "clientTime":time,
                    ]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func register(){
        let time = getTime();
        let userId:Int64 = 7777;
        let url = serverUrl + "/user/register";
        let dic = ["api":"user/register",
                   "appId":"11",
                   "userId":userId,
                   "deviceId":"55555",
                   "deviceType":"iOS",
                   "country":"china",
                   "clientTime":time
        ] as [String : Any]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func login(){
        let time = getTime();
        let userId:Int64 = 1111111;
        let url = serverUrl + "/user/login";
        let dic = [ "api":"user/login",
                    "appId":"11",
                    "userId":userId,
                    "clientTime":time
        ] as [String : Any]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func pay(){
        let time = getTime();
        let userId:Int64 = 1111111;
        let payMoney:Int = 35;
        let url = serverUrl + "/user/pay";
        let dic = [ "api":"user/pay",
                    "appId":"11",
                    "userId":userId,
                    "payMoney":payMoney,
                    "clientTime":time
        ] as [String : Any]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func online(){
        let time = getTime();
        let userId:Int64 = 1111111;
        let url = serverUrl + "/user/online";
        let dic = [ "api":"user/online",
                    "appId":"11",
                    "userId":userId,
                    "clientTime":time
        ] as [String : Any]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    
    func test(){
        let time = getTime();
        let userId:Int64 = 7777;
        let url = serverUrl + "/user/onlogintest";
        let dic = [ "api":"user/login",
                    "appId":"11",
                    "userId":userId,
                    "clientTime":time
            ] as [String : Any]
        NetWorking.current.post(dic: dic, urlStr: url);
    }
    
    func appsflyerActive(){
        AppsFlyerTracker.shared().trackAppLaunch()
    }
    
    func appsflyerRegister(){
        AppsFlyerTracker.shared().trackEvent(AFEventCompleteRegistration, withValues: nil);
    }
    
    func appsflyerLogin(){
        AppsFlyerTracker.shared().trackEvent(AFEventLogin, withValues: nil);
    }
    
    func appsflyerPay(){
        let purchaseDic:[String:Any] = [AFEventParamContentId:"1234567",
                                        AFEventParamContentType : "category_a",
                                        AFEventParamRevenue: 200,
                                        AFEventParamCurrency:"USD"]
        AppsFlyerTracker.shared().trackEvent(AFEventPurchase, withValues: purchaseDic);
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
        //stopTimer();
    }
    
    func getTime()->String{
        let serverTime = NSDate().timeIntervalSince1970;
        let timeStr:String = String(serverTime);
        let index = timeStr.index(timeStr.startIndex, offsetBy: 10);
        let time = timeStr.substring(to: index);
        return time;
    }
    var seastarTimer = Timer();
    
    let serverUrl:String = "http://10.10.10.248:8080";
    //启动定时器
    func startTimer(){
        //print(Thread.current);
        self.seastarTimer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.postData), userInfo: nil, repeats: true);
        //print(Thread.current);
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
            self.online();
        }
    }
}

