//
//  TweetViewController.swift
//  Twitter
//
//  Created by luciano scarpaci on 9/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TweetTextView.becomeFirstResponder()
        
        
    }
 
    
    @IBOutlet weak var TweetTextView: UITextView!
    
    
    @IBAction func cancelButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        
        if (!TweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: TweetTextView.text, success: { self.dismiss(animated: true, completion: nil) }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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
