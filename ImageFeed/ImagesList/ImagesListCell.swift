//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Диана Симонян on 16.05.2023.
//


import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
}
