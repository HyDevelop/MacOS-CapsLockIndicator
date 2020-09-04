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
    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    // Menu link
    @IBOutlet weak var menu: NSMenu?
    
    // Images (images[capslock] = image)
    var images = [true: NSImage(named: "enabled")!, false: NSImage(named: "disabled")!]

    // Set status bar
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        // Add capslocks event handler
        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged, handler: flagsChanged)
        
        // Default image
        statusItem.button?.image = images[false]
        
        // Open application menu on click
        statusItem.menu = menu
    }
    
    // Event handler to check if capslock is enabled
    func flagsChanged(with event: NSEvent)
    {
        // Get caps lock state
        let caps = event.modifierFlags.intersection(.deviceIndependentFlagsMask).contains(.capsLock)
        
        // Change image
        statusItem.button?.image = images[caps]
    }
}

