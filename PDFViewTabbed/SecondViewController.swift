//
//  SecondViewController.swift
//  PDFViewTabbed
//
//  Created by Vui Nguyen on 6/22/17.
//  Copyright © 2017 Sunfish Empire. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
 

  var pdfView: PDFViewCustom!

  override func viewDidLoad() {
    super.viewDidLoad()
    //let documentName = "MNS-354327"
    //let documentName = "Linear Regression Using R- An Introduction to Data Modeling"
    let documentName = "infoGuideSunfishEmpire"
    self.pdfView = PDFViewCustom(documentName: documentName, frame: self.view.frame)
    self.view.addSubview(self.pdfView)
    print("finished second tab")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

