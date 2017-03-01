//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小川拓未 on 2017/02/24.
//  Copyright © 2017年 takumi.ogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //UIimage Viewのoutlet接続（関数名：myImage）
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var FrontButton: UIButton!
    
    @IBOutlet weak var StartStopButton: UIButton!
    
    @IBOutlet weak var BackButton: UIButton!
    
    
    //変数「カウント」の定義
    var count = 0
    
    //Photsの配列グループを作成
    let Photos = ["Light1.jpg","Light2.jpg","Light3.jpg"]
    
    //「カウント」をもとに画像を表示する関数
    func appear(){
        
        //定数imageに(Photos配列のn番目の）画像を代入
        let image = UIImage(named: Photos[count])
        
        //myImageに定数imageを設置
        myImage.image =  image
    }
    
    
    /// Timerによって、一定の間隔で呼び出される関数
    func uptimer(timer: Timer) {
        
        //画像の番号を1増やす
        count += 1
        if ( count > 2 ) {
            count = 0
        }
        //番号をもとに画像を出力
        appear()
    }
    
    //タイマーの設置
    var timer: Timer!
    
    
    //進むボタンのaction接続
    @IBAction func FrontButton(_ sender: Any) {
        //画像の番号を1増やす
        count += 1
        if ( count > 2 ) {
            count = 0
        }
        //番号をもとに画像を出力
        appear()
    }
    
    
    //戻るボタンのaction接続
    @IBAction func BackButton(_ sender: Any) {
        //画像の番号を1減らす
        count -= 1
        if ( count < 0 ) {
            count = 2
        }
        //番号をもとに画像を出力
        appear()
    }
    
    
    //再生・停止ボタンのaction接続
    @IBAction func StartStopButton(_ sender: Any) {
        // タイマーを設定
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(uptimer),
                userInfo: nil,
                repeats: true
            )
            //表示をStopに変える
            StartStopButton.setTitle("Stop", for: .normal)
            FrontButton.isEnabled = false // ボタン無効
            BackButton.isEnabled = false // ボタン無効
        }
        else {
            // 現在のタイマーを破棄する
            self.timer.invalidate()
            // startTimer() の timer == nil で判断するために、timer = nil としておく
            self.timer = nil
            //表示をStartに変える
            StartStopButton.setTitle("Start", for: .normal)
            FrontButton.isEnabled = true // ボタン有効
            BackButton.isEnabled = true // ボタン有効
        }
        
    }
    
    
    
    @IBAction func Return(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //定数imageに(Photos配列の0番目の）UIImageを代入
        let image = UIImage(named: Photos[0])
        
        //myImageに定数imageを設置
        myImage.image =  image
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.ukezara = Photos[count]
        
        if self.timer != nil{
            // 現在のタイマーを破棄する
            self.timer.invalidate()
            // startTimer() の timer == nil で判断するために、timer = nil としておく
            self.timer = nil
            //表示をstartに変える
            StartStopButton.setTitle("Start", for: .normal)
            FrontButton.isEnabled = true // ボタン有効
            BackButton.isEnabled = true // ボタン有効
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
