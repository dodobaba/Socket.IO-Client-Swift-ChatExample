//
//  ViewController.swift
//  test02
//
//  Created by ekain on 16/3/12.
//  Copyright © 2016年 ekain. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class ViewController: UIViewController {
    var socket: SocketIOClient!
    @IBOutlet weak var mylable: UILabel!
    @IBOutlet weak var myinput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        socket = appDelegate.socket
        
        socket.on("new message"){(data,emitter) in
            if let msg = data as? [String]{
            self.mylable.text = msg[0]
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mybutton(sender: UIButton) {
        socket.emit("send message", myinput.text!)
        
    }

}

