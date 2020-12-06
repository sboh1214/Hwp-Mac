import Cocoa
import KeyboardShortcuts

final class Storyboard {
    static let main = NSStoryboard("Main")
    static let preference = NSStoryboard("Preference")
    static let about = NSStoryboard("About")
}

final class Window {
    static let document = NSStoryboard.SceneIdentifier("Document Window")
    static let preference = NSStoryboard.SceneIdentifier("Preference Window")
    static let about = NSStoryboard.SceneIdentifier("About Window")
}

final class View {
    static let sidebar = NSStoryboard.SceneIdentifier("Sidebar View")
    static let document = NSStoryboard.SceneIdentifier("Document View")
    static let inspector = NSStoryboard.SceneIdentifier("Inspector View")
}

extension KeyboardShortcuts.Name {
    static let test = Self("test")
}
