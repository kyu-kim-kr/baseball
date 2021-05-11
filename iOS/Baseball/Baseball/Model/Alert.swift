//
//  Alert.swift
//  Baseball
//
//  Created by 심영민 on 2021/05/11.
//

import UIKit
class Alert {
    private static let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    static func showErrorAlert(error: String) -> UIAlertController{
        alert.message = error
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
    func showGameAlert(away: String, home: String) {}
}
