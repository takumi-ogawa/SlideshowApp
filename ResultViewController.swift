//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 小川拓未 on 2017/02/27.
//  Copyright © 2017年 takumi.ogawa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    @IBOutlet weak var ResultView: UIImageView!
    
    var ukezara: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ResultView.image = UIImage(named: ukezara)
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
