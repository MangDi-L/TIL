//
//  ViewController.swift
//  NavigationBar_Practice
//
//  Created by Mangdi on 2022/12/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.topItem?.title = "aaaaa"
        navigationItem.title = "aaaa"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "car"), primaryAction: nil, menu: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: nil, action: nil)
        settingLabels()
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") else {
            return
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }

    private func settingLabels() {
        let text1 = "안녕하세요반가워요잘있어요다시만나요"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.red
        ]
        label1.attributedText = NSAttributedString(string: text1, attributes: attributes)

        let attributeText = NSMutableAttributedString(string: text1)
        attributeText.addAttribute(.foregroundColor,
                                   value: UIColor.red,
                                   range: NSRange(location: 7, length: 5))
        label2.attributedText = attributeText

        attributeText.addAttribute(.strikethroughStyle,
                                   value: NSUnderlineStyle.single.rawValue,
                                   range: NSMakeRange(0, attributeText.length))
        label3.attributedText = attributeText

//        attributeText.addAttribute(.font, value: NS, range: <#T##NSRange#>)
    }
}


