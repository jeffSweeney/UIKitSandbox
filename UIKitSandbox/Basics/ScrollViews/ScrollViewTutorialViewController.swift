//
//  ScrollViewTutorialViewController.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/11/25.
//

import UIKit

class ScrollViewTutorialViewController: UIViewController {

    private var scrollView = UIScrollView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private let rectHeight: CGFloat = 200
    private let numberOfRects = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    private func configureLayout() {
        for _ in 1 ..< numberOfRects {
            let rect = createRect()
            stackView.addArrangedSubview(rect)
        }
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = (CGFloat(numberOfRects) * rectHeight) + 64
    }
    
    private func createRect() -> UIView {
        let rect = UIView()
        rect.backgroundColor = .red
        rect.layer.cornerRadius = 8
        
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        rect.widthAnchor.constraint(equalToConstant: rectHeight+20).isActive = true
        
        return rect
    }
}

extension ScrollViewTutorialViewController: UIScrollViewDelegate {
    // Just some cool examples of the scrolling control you get in UIKit
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("DEBUG: Scroll offset \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("DEBUG: Scroll did end decelerating")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("DEBUG: Scroll did end dragging")
    }
}

#Preview {
    ScrollViewTutorialViewController()
}
