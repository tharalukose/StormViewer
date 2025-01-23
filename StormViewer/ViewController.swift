//
//  ViewController.swift
//  StormViewer
//
//  Created by T Maliackal on 1/18/25.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        /*Bundle.main.resourcePath tells you where the resources are located, but it’s not enough by itself to let you directly access files for manipulation (such as reading or listing them).
         FileManager gives you the actual tools to interact with the file system, which includes accessing the directory and reading its contents.*/
        //        let fm = FileManager.default
        //        let path = Bundle.main.resourcePath!
        //        let items = try! fm.contentsOfDirectory(atPath: path)
        //
        //        for item in items {
        //            if item.hasPrefix("nssl") {
        //
        //            }
        //        }
        let fm = FileManager.default
        guard let path = Bundle.main.resourcePath else{
            print("resourcepath is nil")
            return
        }
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
            
        } catch {
            print("Failed to read contents of the directory: \(error)")
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PicCell", for: indexPath)
        var cellContext = cell.defaultContentConfiguration()
        cellContext.text = pictures[indexPath.row]
        cell.contentConfiguration = cellContext
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImg = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

