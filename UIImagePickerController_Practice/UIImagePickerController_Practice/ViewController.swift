//
//  ViewController.swift
//  UIImagePickerController_Practice
//
//  Created by Mangdi on 2022/12/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imagePlusButton: UIButton!
    @IBOutlet weak var testImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func touchUpImagePlusButton(_ sender: UIButton) {
        presentAlbum()
    }
    
    func presentAlbum() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    private func makeImageView(image: UIImage) -> UIImageView {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            return imageView
        }()
        return imageView
    }
}

// 이미지를 선택하고 카메라를 찍었을 때 다양한 동작을 도와준다.
// 앨범 사진을 선택했을 때, 화면 전환을 네비게이션으로 이동한다.
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.editedImage] as? UIImage {
            let imageView = makeImageView(image: image)
            stackView.addArrangedSubview(imageView)
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                              multiplier: 0.15).isActive = true
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,
                                             multiplier: 1).isActive = true
            stackView.insertArrangedSubview(imagePlusButton,
                                            at: stackView.arrangedSubviews.endIndex)
            testImageView.image = image
        }
        
        if stackView.arrangedSubviews.count >= 6 {
            imagePlusButton.isHidden = true
        }
        dismiss(animated: true)
    }
}
