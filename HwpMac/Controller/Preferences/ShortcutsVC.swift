import Cocoa
import KeyboardShortcuts

class ShortcutsVC: NSViewController {
    override func loadView() {
        view = NSView()

        let recorder = KeyboardShortcuts.RecorderCocoa(for: .test)
        view.addSubview(recorder)
    }
}
