//
//  YellowViewController.swift
//  TestStoryboard
//
//  Created by Mangdi on 2022/09/07.
//

import UIKit

class YellowViewController: UIViewController {
    
    @IBAction func dismissButton(sender: UIButton) {
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "YELLO VIEW"
        print("\nyellow 화면 이동\n")
        print("(second)viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("(second)viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("(second)viewDidAppear\n")
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("\n화면 이동\n")
        print("(second)viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("(second)viewDidDisappear")
    }
    

}
