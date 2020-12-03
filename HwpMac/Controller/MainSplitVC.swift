import Cocoa

class MainSplitVC: NSSplitViewController {
    private let splitViewResorationIdentifier = "dev.sboh.HwpMac:mainSplitViewController"

    override func viewDidLoad() {
        defer {
            super.viewDidLoad()
        }

        splitView.dividerStyle = .thin
        splitView.autosaveName = NSSplitView.AutosaveName(splitViewResorationIdentifier)
        splitView.identifier = NSUserInterfaceItemIdentifier(rawValue: splitViewResorationIdentifier)

        guard let vcLeft = storyboard!.instantiate(View.sidebar) as? NSViewController else {
            return
        }
        guard let vcMiddle = storyboard!.instantiate(View.document) as? NSViewController else {
            return
        }
        guard let vcRight = storyboard!.instantiate(View.inspector) as? NSViewController else {
            return
        }

        let sidebarItem = NSSplitViewItem(viewController: vcLeft)
        sidebarItem.canCollapse = false

        addSplitViewItem(sidebarItem)

        let mainItem = NSSplitViewItem(viewController: vcMiddle)
        addSplitViewItem(mainItem)

        let inspectorItem = NSSplitViewItem(viewController: vcRight)
        addSplitViewItem(inspectorItem)
    }
}
