import Cocoa
import KeyboardShortcuts

final class Storyboard {
    static let main = NSStoryboard("Main")
    static let preference = NSStoryboard("Preference")
}

final class Window {
    static let document = NSStoryboard.SceneIdentifier("Document Window Controller")
}

final class View {
    static let sidebar = NSStoryboard.SceneIdentifier("Sidebar View")
    static let document = NSStoryboard.SceneIdentifier("Document View")
    static let inspector = NSStoryboard.SceneIdentifier("Inspector View")

    static let preference = NSStoryboard.SceneIdentifier("Preference View")
}

extension KeyboardShortcuts.Name {
    static let test = Self("test")
}
