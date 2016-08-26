//
//  Theme.swift
//  MyAddress
//
//  This contains style changes for the app
//
//  Created by Ravi Shankar on 26/08/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

// MARK:- applyTheme

func applyTheme() {
    
    //StatusBar
    UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    UIApplication.shared.isStatusBarHidden = false
    
    //NavigationBar
    UINavigationBar.appearance().barTintColor = mainColor
    UINavigationBar.appearance().tintColor = UIColor.white
    UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: standardTextFont,  NSForegroundColorAttributeName: UIColor.white]
    
    //UITableView
    UITableView.appearance().backgroundColor = backgroundColor
    
    //UITableViewCell
    UITableViewCell.appearance().backgroundColor = backgroundColor
}

var mainColor: UIColor {
    return UIColor(red: 88/255.0, green: 86/255.0, blue: 214/255.0, alpha: 1.0)
}

var backgroundColor: UIColor {
    return UIColor.gray
}

var textColor: UIColor {
    return UIColor.white
}

var standardTextFont: UIFont {
    return UIFont(name: "HelveticaNeue-Light", size: 17)!
}

