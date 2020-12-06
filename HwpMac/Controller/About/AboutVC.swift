//
//  AboutVC.swift
//  HwpMac
//
//  Created by Seungbin Oh on 2020/12/06.
//

import Cocoa

class AboutVC: NSViewController {

    @IBOutlet weak var nameLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.stringValue = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Unknown"
    }

}
