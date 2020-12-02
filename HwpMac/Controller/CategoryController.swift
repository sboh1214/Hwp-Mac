import Cocoa

class CategoryController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CategoryController: NSTableViewDataSource {

  func numberOfRows(in tableView: NSTableView) -> Int {
    return cellList.count
  }

}

extension CategoryController: NSTableViewDelegate {

  fileprivate enum CellIdentifiers {
    static let ImageCell = "ImageCell"
    static let TitleCell = "TitleCell"
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

    var image: NSImage?
    var text: String = ""
    var cellIdentifier: String = ""

    let item = cellList[row]

    // 2
    if tableColumn == tableView.tableColumns[0] {
      image = NSImage()
      cellIdentifier = CellIdentifiers.ImageCell
    } else if tableColumn == tableView.tableColumns[1] {
        text = item.title
      cellIdentifier = CellIdentifiers.TitleCell
    }

    // 3
    if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
      cell.textField?.stringValue = text
      cell.imageView?.image = image ?? nil
      return cell
    }
    return nil
  }

}

struct Cell {
    let image: String
    let title: String
}

let cellList = [
    Cell(image: "", title: "Keyboard")
]
