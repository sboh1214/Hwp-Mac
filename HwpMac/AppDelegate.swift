import Cocoa
import KeyboardShortcuts

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var preferencesMenu: NSMenuItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        preferencesMenu.action = #selector(clickPreferenceMenu(_:))

        KeyboardShortcuts.onKeyUp(for: .test) {
            print("KeyboardShortcuts test")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }

    lazy var preferenceStoryboard = Storyboard.preference
    lazy var preferenceController = preferenceStoryboard.instantiate(View.preference) as? NSWindowController

    @objc func clickPreferenceMenu(_ sender: Any) {
        if let controller = preferenceController {
            controller.showWindow(self)
        }
    }
}
