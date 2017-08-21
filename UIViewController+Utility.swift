//
//  UIViewController+Utility.swift
//  Late Lateef
//
//  Created by subhajit halder on 23/12/16.
//  Copyright © 2016 Tanmoy. All rights reserved.
//

import Foundation
import UIKit

let kAlertTintColor = UIColor(red: CGFloat(0.49), green: CGFloat(0.03), blue: CGFloat(0.31), alpha: CGFloat(1.0))

typealias AlertCompletion = (_ object: Any?,_ actionId: Int?) -> Void

extension UIViewController {
    
    
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-240, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    

    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func openSlide(_ sender: Any) {
        //let slide = SlideMenuVC.sharedInstance
       // slide.toggleSlide()
    }
    
    @objc(positionForBar:) func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    
    
    func showAlert(withTitle title: String?, andMessage msg: String?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let firstView: UIView? = alertController.view.subviews.first
        let secView: UIView? = firstView?.subviews.first
        secView?.backgroundColor = UIColor(red: CGFloat(0.996), green: CGFloat(0.996), blue: CGFloat(0.980), alpha: CGFloat(1.00))
        secView?.layer.cornerRadius = 3.0
        alertController.view.tintColor = kAlertTintColor
        let actionOk = UIAlertAction(title: "Ok", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: { _ in })
        })
        alertController.addAction(actionOk)
        DispatchQueue.main.async(execute: {() -> Void in
            if !(self.presentedViewController is (UIAlertController)) {
                self.present(alertController, animated: true, completion: { _ in })
            }
        })
    }
    
    
    func showAlert(withTitle title: String?, andMessage msg: String?, handler: @escaping AlertCompletion) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let firstView: UIView? = alertController.view.subviews.first
        let secView: UIView? = firstView?.subviews.first
        secView?.backgroundColor = UIColor(red: CGFloat(0.996), green: CGFloat(0.996), blue: CGFloat(0.980), alpha: CGFloat(1.00))
        secView?.layer.cornerRadius = 3.0
        alertController.view.tintColor = kAlertTintColor
        let actionOk = UIAlertAction(title: "Ok", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: { _ in
                
//                handler(nil, 0)
            
            })
            DispatchQueue.main.async(execute: {() -> Void in
                handler(nil, 0)
            })
        })
        alertController.addAction(actionOk)
        DispatchQueue.main.async(execute: {() -> Void in
            if !(self.presentedViewController is (UIAlertController)) {
                self.present(alertController, animated: true, completion: { _ in })
            }
        })
    }

    
    
    
}
