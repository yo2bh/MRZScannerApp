//
//  ViewController.swift
//  MRZScanner
//
//  Created by Yogesh Bharate on 8/11/20.
//  Copyright © 2020 mastercard. All rights reserved.
//

import UIKit
import QKMRZScanner

class ViewController: UIViewController, QKMRZScannerViewDelegate {
  
  @IBOutlet weak var mrzScannerView: QKMRZScannerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mrzScannerView.delegate = self
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mrzScannerView.startScanning()
  }
  
  func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind scanResult: QKMRZScanResult) {
    print(scanResult)
    let resultString = "DOB - \(scanResult.birthDate)\n" + "countryCode - \(scanResult.countryCode)\n" + "documentNumber - \(scanResult.documentNumber)\n" + "documentImage - \(scanResult.documentImage)\n" + "documentType - \(scanResult.documentType)" + "expireDate - \(scanResult.expiryDate)\n" + "faceimage - \(scanResult.faceImage)\n" + "givenNames - \(scanResult.givenNames)\n" + "nationality - \(scanResult.nationality)\n" + "personalNumber - \(scanResult.personalNumber)\n" + "personalNumber2 - \(scanResult.personalNumber2)\n" + "sex - \(scanResult.sex)\n" + "surnames - \(scanResult.surnames)\n"
    debugPrint("Scan Result - \(resultString)")
    showAlert(resultString)
  }
  
  func showAlert(_ message: String) {
    let alertVC = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertVC.addAction(okButton)
    self.present(alertVC, animated: true, completion: nil)
  }
}

