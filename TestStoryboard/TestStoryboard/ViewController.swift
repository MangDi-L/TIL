//
//  ViewController.swift
//  TestStoryboard
//
//  Created by Mangdi on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var firstView: UIView!
    @IBOutlet private weak var secondView: UIView!
    @IBOutlet private weak var thirdView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "asdfasdf"
        print("viewDidLoad")
        testCG()
//        testUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear\n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }
    
    private func testCG() {
        let rect = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    private func testUI() {
        firstView.frame.origin = CGPoint(x: 30, y: 400)
        firstView.frame.size = CGSize(width: 300, height: 300)
        firstView.bounds.origin = CGPoint(x: 30, y: 30)
        debugPrint(secondView.frame)
        secondView.frame.origin = CGPoint(x: 30, y: 30)
        debugPrint(secondView.frame)
        secondView.bounds.origin = CGPoint(x: -60, y: -60)
        secondView.clipsToBounds = true
    }
    
    @IBAction func touchUpTestButton(sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: "hello world",
                                                         message: "it's test",
                                                         preferredStyle: .alert)
        let yellowAction: UIAlertAction = UIAlertAction(title: "YELLOW",
                                                    style: .default) { UIAlertAction in
//            let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "OrangeVC")
//            orangeVC?.modalTransitionStyle = .coverVertical
//            self.present(orangeVC!, animated: true, completion: nil)
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let orangeVC = storyboard.instantiateViewController(withIdentifier: "OrangeVC")
            self.present(orangeVC, animated: true, completion: nil)
        }
        let blueAction: UIAlertAction = UIAlertAction(title: "BLUE",
                                                      style: .default) { _ in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let blueVC = storyboard.instantiateViewController(withIdentifier: "BlueVC")
            self.present(blueVC, animated: true, completion: nil)
        }
        alert.addAction(yellowAction)
        alert.addAction(blueAction)
        present(alert, animated: true, completion: nil)
    }
}

