import Cocoa

extension NSStoryboard {
    func instantiate(_ identifier: SceneIdentifier) -> Any {
        return self.instantiateController(withIdentifier: identifier)
    }
}
