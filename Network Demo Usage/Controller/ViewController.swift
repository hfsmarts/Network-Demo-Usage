//
//  ViewController.swift
//  Network Demo Usage
//
//  Created by Harun Fazlic on 7. 6. 2022..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
    didSet{
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
        }
    }
    
    var objects: [Datum] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://reqres.in/api/user?page=2")!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let parsedData = try? JSONDecoder().decode(Welcome.self, from: data!){
                self.objects = parsedData.data
            }

        }.resume()
    }
}

//MARK: Table View Delegate

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: Table View Data Source

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        105
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = objects[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self), for: indexPath) as?  CustomTableViewCell
                
        cell?.boldLabel.text = object.name.capitalized
        cell?.regularLabel.text = String(object.year)
        cell?.circleView.backgroundColor = UIColor(hex: "\(object.color)FF")
  
        return cell!
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}




