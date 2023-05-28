//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Диана Симонян on 19.05.2023.
//

import UIKit

final class SingleImageViewController: UIViewController {
    @IBOutlet var bigImage: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    @IBAction private func didTapBackButton()  {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func didTapShareButton() {
        let share = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        present(share, animated: true, completion: nil)
    }
    
    
    
    var image: UIImage! {
        didSet {
            
            guard isViewLoaded else { return } // 1
            bigImage.image = image // 2
            rescaleAndCenterImageInScrollView(image: image)
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImage.image = image
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        rescaleAndCenterImageInScrollView(image: image)
    }



    
private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, max(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        bigImage
    }
}
    
