import Cocoa
import Alamofire

class LicenseVC: NSViewController {

    @IBOutlet var licenseTextView: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://raw.githubusercontent.com/sboh1214/Hwp-Mac/main/LICENSE").response { response in
            guard let data = response.data else {
                return
            }
            guard let license = String(data: data, encoding: .utf8) else {
                return
            }
            self.licenseTextView.string = license
        }
    }
}
