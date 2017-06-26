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

class PDFViewCustom: PDFView, PDFDocumentDelegate {

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
      pdfView = loadViewFromNib()

      pdfView.frame = bounds

      // Make the view stretch with containing view
      pdfView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]

      if let documentURL = Bundle.main.url(forResource: self.documentName, withExtension: "pdf"),
        let document = PDFDocument(url: documentURL),
        let _ = document.page(at: 0) {
      document.delegate = self
      pdfView?.document = document
      pdfView?.autoScales = true
      pdfView?.displayMode = .singlePage
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
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      let view = nib.instantiate(withOwner: self, options: nil).first
      return view as! PDFView
    }

    // PDFDocumentDelegate
    func classForPage() -> AnyClass {
        return WatermarkPage.self
    }

}
