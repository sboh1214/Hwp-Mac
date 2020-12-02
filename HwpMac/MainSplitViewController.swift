import Cocoa

class MainSplitViewController: NSSplitViewController {
    private let splitViewResorationIdentifier = "dev.sboh.HwpMac:mainSplitViewController"
    
    override func viewDidLoad() {
        splitView.dividerStyle = .thin
        splitView.autosaveName = NSSplitView.AutosaveName(splitViewResorationIdentifier)
        splitView.identifier = NSUserInterfaceItemIdentifier(rawValue: splitViewResorationIdentifier)
        
        let vcLeft = storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Sidebar View")) as! NSViewController
        let vcMiddle = storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document View")) as! NSViewController
        let vcRight = storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Inspector View")) as! NSViewController
        
        let sidebarItem = NSSplitViewItem(viewController: vcLeft)
        sidebarItem.canCollapse = false
        
        // I'm not sure about this line. I've commented it out. Will explore later
        // sidebarItem.holdingPriority = NSLayoutConstraint.Priority(NSLayoutConstraint.Priority.defaultLow.rawValue + 1)
        addSplitViewItem(sidebarItem)
        
        let mainItem = NSSplitViewItem(viewController: vcMiddle)
        addSplitViewItem(mainItem)
        
        let inspectorItem = NSSplitViewItem(viewController: vcRight)
        addSplitViewItem(inspectorItem)
        
        super.viewDidLoad()
    }
}
