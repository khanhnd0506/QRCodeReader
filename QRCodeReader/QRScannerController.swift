//
//  QRScannerController.swift
//  QRCodeReader
//
//  Created by Simon Ng on 13/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift

class QRScannerController: RSCodeReaderViewController {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?

    @IBOutlet var messageLabel:UILabel!
    @IBOutlet var topbar: UIView!
    var dispatched: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.focusMarkLayer.strokeColor = UIColor.red.cgColor
        
        self.cornersLayer.strokeColor = UIColor.yellow.cgColor
        
        self.tapHandler = { point in
            print(point)
        }
        self.barcodesHandler = { barcodes in
            if !self.dispatched {
                self.dispatched = true
                for barcode in barcodes {
                    print("Barcode found: type=" + barcode.type + " value=" + barcode.stringValue)
                    let infoVC = InfoViewController()
                    infoVC.qrInfo = barcode.stringValue
                    DispatchQueue.main.async(execute: {
                        self.messageLabel.text = barcode.stringValue
                        self.navigationController?.pushViewController(infoVC, animated: true)
                    })
                    break
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dispatched = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
