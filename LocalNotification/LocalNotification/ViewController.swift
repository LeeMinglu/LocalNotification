//
//  ViewController.swift
//  LocalNotification
//
//  Created by 李明禄 on 2016/12/2.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func rock(_ sender: AnyObject) {
        let notificatineCenter = UNUserNotificationCenter.current()
        notificatineCenter.delegate = self
        
        //请求授权
        
        
        notificatineCenter.requestAuthorization(options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.badge, UNAuthorizationOptions.sound], completionHandler: { (granted, error) in
            if granted {
                print("注册成功")
//                notificatineCenter.delegate = self
            }else {
                print("注册失败!")
                print(error!)
            }
            
        })
        
        let content = UNMutableNotificationContent.init()
        content.badge = 2333
        content.title = "标题"
        content.body = "消息体"
        content.subtitle = "子标题！"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: "rock", content: content, trigger: trigger)
        
        notificatineCenter.add(request) { (error) in
//            if error != nil {
//                print("^^^^^^^^^^")
//                print(error)
//            } else {
//                print("***************")
//                print(error)
//            }
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
    }


}

