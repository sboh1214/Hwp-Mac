import Cocoa
import Alamofire

class ContributorsVC: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!

    var users: [User] = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        AF.request("https://api.github.com/repos/sboh1214/Hwp-Mac/contributors").responseJSON { response in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let data = response.data else {
                    return
                }
                self.users = try decoder.decode([User].self, from: data)
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        return users.count
    }

    fileprivate enum CellIdentifiers {
        static let IdCell = "githubId"
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        var image: NSImage?
        var text: String = ""
        var cellIdentifier: String = ""

        let item = users[row]

        if tableColumn == tableView.tableColumns[0] {
            text = item.login
            cellIdentifier = CellIdentifiers.IdCell
        }

        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            cell.imageView?.image = image ?? nil
            return cell
        }
        return nil
    }
}

// swiftlint:disable identifier_name
struct User: Codable {
    let login: String
    let id: Int
    let avatarUrl: String
    let htmlUrl: String
    let contributions: Int
}
// swiftlint:enable identifier_name
