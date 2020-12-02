import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {

    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }

    lazy var preferenceController = NSStoryboard(name: "Preference", bundle: nil).instantiateController(withIdentifier: "Preference View")
            as? NSWindowController

    @IBAction func clickMenuPreference(_ sender: Any) {
        if let controller = preferenceController { controller.showWindow(self) }
    }
}
