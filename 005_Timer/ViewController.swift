//
//  ViewController.swift
//  005_Timer
//
//  Created by 松島優希 on 2020/11/15.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        if !timer.isValid{
            //タイマーが動いていないときの処理
            timer = Timer.scheduledTimer(timeInterval:0.01,
                target:self,
                selector:#selector(self.up),
                userInfo:nil,
                repeats:true)
        }
        comment.text = ""
    }
    
    @IBAction func stop(_ sender: Any) {
        if timer.isValid{
            //タイマーが動いていたら(Trueなら)止める処理
            timer.invalidate()
            //invalidate:無効にする
            self.hantei()
        }
    }
    
    @objc func up(){
        count += 0.01 //count = count + 0.01
        label.text = String(format: "%.2f",count)
    }
    
    @IBAction func reset(_ sender: Any) {
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f",count)
        comment.text = ""
    }
    
    func hantei(){
        if count >= 9.80 && count <= 10.20{
            comment.text = "PERFECT!!"
            comment.textColor = UIColor.red
        }else if count >= 9.70 && count <= 10.30{
            comment.text = "GREAT!"
            comment.textColor = UIColor.yellow
        }else if count >= 9.50 && count <= 10.50{
            comment.text = "GOOD"
            comment.textColor = UIColor.green
        }else{
            comment.text = "BAD:("
            comment.textColor = UIColor.blue
        }
    }
    
}

