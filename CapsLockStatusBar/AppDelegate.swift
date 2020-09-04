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
    
    // Menu link
    @IBOutlet weak var menu: NSMenu?
    
    // Images (images[capslock] = image)
    var images = [true: NSImage(named: "enabled")!, false: NSImage(named: "disabled")!]
    
    var capslock = false

    // Set status bar
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        // Add capslocks event handler
        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged, handler: flagsChanged)

        // Create status item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        // Image
        statusItem?.button?.image = images[capslock]
        
        // Open application menu on click (TODO: Simplify?)
        if let menu = menu {
            statusItem?.menu = menu
        }
    }
    
    // Event handler to check if capslock is enabled
    func flagsChanged(with event: NSEvent)
    {
        capslock = event.modifierFlags.intersection(.deviceIndependentFlagsMask).contains(.capsLock)
        statusItem?.button?.image = images[capslock]
        print("Capslock: " + String(capslock))
    }
}

