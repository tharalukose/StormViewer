//
//  DetailViewController.swift
//  StormViewer
//
//  Created by T Maliackal on 1/21/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    var selectedImg : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //both title and selectedImg optionals
        title = selectedImg
        //id for this vc
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImg{
            img.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
