//
//  InfoViewController.swift
//  QRCodeReader
//
//  Created by KhanhND on 10/3/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    var qrInfo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let qrInfo = qrInfo {
            infoLabel.text = qrInfo
        }
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
