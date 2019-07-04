//
//  ViewController.swift
//  PersonalAssistant
//
//  Created by Amanda Tavares on 03/07/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    let classificationService = ClassificationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        self.textView.delegate = self
//        adjustUITextViewHeight(self.textView)
        
        show(sentiment: .neutral)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    // MARK: - Data

    private func show(sentiment: Sentiment) {
        bottomLabel.backgroundColor = sentiment.color
        bottomLabel.text = "\(sentiment.message)"
    }
    
    // MARK: - Action
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textView.resignFirstResponder()
    }

}


// MARK: - UITextViewDelegate

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text else {
            return
        }
        
        let sentiment = classificationService.predictSentiment(from: text)
        show(sentiment: sentiment)
    }
    func adjustUITextViewHeight(_ textView : UITextView)
    {
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.sizeToFit()
        textView.isScrollEnabled = false
    }
}
