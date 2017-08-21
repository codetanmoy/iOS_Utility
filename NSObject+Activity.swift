
//
//  NSObject+Activity.swift
//  
//
//  Created by Tanmoy on 20/01/17.
//  Copyright © 2017 Tanmoy. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension NSObject {
    
    func startActivity() {
        //    __weak typeof(AppDelegate)*weakDelegate = [[UIApplication sharedApplication]delegate];
        let appDelegate: AppDelegate? = (UIApplication.shared.delegate as? AppDelegate)
        UIApplication.shared.beginIgnoringInteractionEvents()
        let progress = MBProgressHUD.showAdded(to: (appDelegate?.window)!, animated: true)
        UIApplication.shared.endIgnoringInteractionEvents()
        progress.label.text = "Loading..."
    }
    
    func stopActivity() {
        let appDelegate: AppDelegate? = (UIApplication.shared.delegate as? AppDelegate)
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        MBProgressHUD.hide(for: (appDelegate?.window)!, animated: true)
    }
    
}
