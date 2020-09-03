//
//  AppDelegate.swift
//  CapsLockStatusBar
//
//  Created by Hykilpikonna on 9/3/20.
//  Copyright © 2020 Hykilpikonna. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    // Status bar item
    var statusItem: NSStatusItem?

    // Set status bar
    override func awakeFromNib()
    {
        super.awakeFromNib()

        // Create status item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    }
    
    // Detect if the system is light or dark
    func light() -> Bool
    {
        return UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light" == "Light"
    }
    }
}

