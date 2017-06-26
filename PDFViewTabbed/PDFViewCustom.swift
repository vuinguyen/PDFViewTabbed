//
//  PDFViewCustom.swift
//  PDFViewTabbed
//
//  Created by Vui Nguyen on 6/22/17.
//  Copyright © 2017 Sunfish Empire. All rights reserved.
//

import UIKit
import PDFKit

@IBDesignable

class PDFViewCustom: PDFView {

    var pdfView : PDFView!
    var documentName : String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

  init(documentName: String, frame: CGRect) {
    super.init(frame: frame)
    self.documentName = documentName
    xibSetup()
    print("display screen")
  }

    func xibSetup() {
     // pdfView = loadViewFromNib()

      let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
       // let view: PDFView = nib.instantiate(withOwner: self, options: nil).first as! PDFView
      pdfView = nib.instantiate(withOwner: self, options: nil).first as! PDFView        // use bounds not frame or it'll be offset
        pdfView.frame = bounds

        // Make the view stretch with containing view
        pdfView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]


        // Adding custom subview on top of our view (over any custom drawing > see note below)
      //self.documentName = "MNS-354327"
      if let documentURL = Bundle.main.url(forResource: self.documentName, withExtension: "pdf"),
     let document = PDFDocument(url: documentURL),
     let page = document.page(at: 0) {
      pdfView?.document = document
      //pdfView?.backgroundColor = .brown
      pdfView?.autoScales = true
      //pdfView?.displaysAsBook = true
      pdfView?.displayMode = .singlePage
      //pdfView?.displaysPageBreaks = true
      pdfView?.usePageViewController(true, withViewOptions: nil)

        print("document is \(String(describing: documentName))")
      print("Displaying our first PDF!")
      print("user can zoom in: \(String(describing: pdfView?.canZoomIn()))")
      print("user can zoom out: \(String(describing: pdfView?.canZoomOut()))")
    }
    else {
      print("Cannot display our first PDF!")
    }

      // that's the key, you must fully design the pdfView before you add it to the subview
      addSubview(pdfView)
    }

    func loadViewFromNib() -> PDFView! {
    //func loadViewFromNib() -> UIView! {

      let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
       // let view: PDFView = nib.instantiate(withOwner: self, options: nil).first as! PDFView
        let view = nib.instantiate(withOwner: self, options: nil).first
        //return view as! UIView

        return view as! PDFView
    }

}
