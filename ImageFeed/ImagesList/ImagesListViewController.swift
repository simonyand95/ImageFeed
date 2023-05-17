//
//  ViewController.swift
//  ImageFeed
//
//  Created by Диана Симонян on 04.05.2023.
//

import UIKit


class ImagesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!


    
  private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
       override func viewDidLoad() {
        super.viewDidLoad()
        //dateLabel.text = Date()
        //sleep(3)
        // Do any additional setup after loading the view.
    }
    
    
}

func configCell(for cell: ImagesListCell) {
    cell.imageView?.image = UIImage(named: "0")
}



extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) // 1
                
                guard let imageListCell = cell as? ImagesListCell else { // 2
                    return UITableViewCell()
                }
                
                configCell(for: imageListCell) // 3
                return imageListCell // 4
    }
    
        
    }
    
    extension ImagesListViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
    
    }

