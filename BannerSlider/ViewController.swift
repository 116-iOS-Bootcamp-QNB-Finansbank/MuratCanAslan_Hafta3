//
//  ViewController.swift
//  BannerSlider
//
//  Created by Samet Bugra Oktay on 15.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let model = [SliderCellViewModel.init(image: UIImage(named: "1"), text: "Haber1"),
                 SliderCellViewModel.init(image: UIImage(named: "2"), text: "Haber2"),
                 SliderCellViewModel.init(image: UIImage(named: "3"), text: "Haber3"),
                 SliderCellViewModel.init(image: UIImage(named: "4"), text: "Haber4"),
                 SliderCellViewModel.init(image: UIImage(named: "5"), text: "Haber5"),]
    
    var currentIndex = 1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        pageControl.numberOfPages = model.count
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pageControl.currentPage == model.count - 1 {
            self.pageControl.currentPage = indexPath.section
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let index = Int(round(offSet/width))
        pageControl.currentPage = index
        }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}

