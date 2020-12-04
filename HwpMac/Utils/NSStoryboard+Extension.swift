import Cocoa

extension NSStoryboard {
    convenience init(_ name: String) {
        self.init(name: name, bundle: nil)
    }

    func instantiate(_ identifier: SceneIdentifier) -> Any {
        return self.instantiateController(withIdentifier: identifier)
    }
}
