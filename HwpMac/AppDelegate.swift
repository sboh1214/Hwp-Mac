import Cocoa
import RxSwift
import RxCocoa
import KeyboardShortcuts

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var aboutMenu: NSMenuItem!
    @IBOutlet weak var preferencesMenu: NSMenuItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        aboutMenu.rx.action.on(
            .next(#selector(openAboutWindow(_:)))
        )
        preferencesMenu.rx.action.on(
            .next(#selector(clickPreferenceMenu(_:)))
        )

        KeyboardShortcuts.onKeyUp(for: .test) {
            print("KeyboardShortcuts test")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }

    @objc func clickPreferenceMenu(_ sender: Any) {
        let preferenceWindow = Storyboard.preference.instantiate(Window.preference) as? NSWindowController
        if let controller = preferenceWindow {
            controller.showWindow(self)
        }
    }

    @objc func openAboutWindow(_ sender: Any) {
        let aboutWindow = Storyboard.about.instantiate(Window.about) as? NSWindowController
        if let window = aboutWindow {
            window.showWindow(self)
        }
    }
}
