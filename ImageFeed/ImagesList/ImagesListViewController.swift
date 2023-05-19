//
//  ViewController.swift
//  ImageFeed
//
//  Created by Диана Симонян on 04.05.2023.
//

import UIKit


class ImagesListViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!

    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
       override func viewDidLoad() {
        super.viewDidLoad()
           tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
           
    }
    
    private lazy var dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateStyle = .long
          formatter.timeStyle = .none
          return formatter
      }()
    
}



extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
      guard let image = UIImage(named: photosName[indexPath.row]) else { // 2
            return
        }
        
        cell.cellImage.image = image
        cell.dateLabel.text = dateFormatter.string(from: Date())
        
        if indexPath.row % 2 == 0 {
            cell.likeButton.imageView?.image = UIImage(named: "like_button_on")
        }
        else {
            cell.likeButton.imageView?.image =  UIImage(named: "like_button_off")
        }
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
          guard let image = UIImage(named: photosName[indexPath.row]) else { // 2
                return
            }
            
            cell.cellImage.image = image
            cell.dateLabel.text = dateFormatter.string(from: Date())
            
            if indexPath.row % 2 == 0 {
                cell.likeButton.imageView?.image = UIImage(named: "like_button_on")
            }
            else {
                cell.likeButton.imageView?.image =  UIImage(named: "like_button_off")
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) // 1
                
                guard let imageListCell = cell as? ImagesListCell else { // 2
                    return UITableViewCell()
                }
                
                configCell(for: imageListCell, with: indexPath) // 3
                return imageListCell // 4
            
    }
    
        
    }
    
    extension ImagesListViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return photosName.count
        }
    
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            guard let image = UIImage(named: photosName[indexPath.row]) else {
                  return 0
              }
            let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
            let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
            let imageWidth = image.size.width
            let scale = imageViewWidth / imageWidth
            let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
            return cellHeight
            
        }
        
    }
    
 
