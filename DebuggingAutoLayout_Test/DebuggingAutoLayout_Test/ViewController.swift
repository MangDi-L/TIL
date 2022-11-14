//
//  ViewController.swift
//  DebuggingAutoLayout_Test
//
//  Created by Mangdi on 2022/11/08.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let emptyView = UIView()
    let button = UIButton()
    let button2 = UIButton()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        createConstraints()
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(button2)
    }
    
    private func createConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.isScrollEnabled = true
        
        emptyView.backgroundColor = .blue
        button.setTitle("눌러보세요", for: .normal)
        button.backgroundColor = .systemMint
        button2.setTitle("눌러보세요", for: .normal)
        button2.backgroundColor = .systemMint
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.backgroundColor = .blue
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        // content layout guide
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,
                                   constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                                       constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                                        constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                                      constant: 0).isActive = true
        
        // frame layout guide
        stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,
                                     constant: 0).isActive = true
//        scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
}

