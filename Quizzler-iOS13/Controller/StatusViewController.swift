//
//  StatusViewController.swift
//  Quizzler-iOS13
//
//  Created by Ali Haider on 19/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    var score = ""
   
    
    @IBOutlet weak var thankyoutext: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreLabel.text = self.score
      
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToMainPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FirstController") as? FirstController
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
