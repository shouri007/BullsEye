//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Shouri on 15/12/15.
//  Copyright © 2015 Shouri. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView:UIWebView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let htmlFile=NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html"){
            
            let htmlData=NSData(contentsOfFile: htmlFile)
            let baseURL=NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            
            webView.loadData(htmlData!, MIMEType: "text/html",
                textEncodingName: "UTF-8", baseURL: baseURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
