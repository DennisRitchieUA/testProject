//
//  UITextViewPlaeholder.swift
//  rentmycar
//
//  Created by Graf iOS Developer on 19.06.17.
//  Copyright © 2017 V-Jet. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceholderTextViewDelegate {
    func placeholderTextViewDidChangeText(_ text:String)
    func placeholderTextViewDidEndEditing(_ text:String)
}

final class UITextViewPlaeholder: UITextView {
    
    var notifier:PlaceholderTextViewDelegate?
    
    var placeholder: String? {
        didSet {
            placeholderLabel?.text = placeholder
        }
    }
    var placeholderColor = UIColor.lightGray
    var placeholderFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            placeholderLabel?.font = placeholderFont
        }
    }
    
    fileprivate var placeholderLabel: UILabel?
    
    // MARK: - LifeCycle
    
    init() {
        super.init(frame: CGRect.zero, textContainer: nil)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(UITextViewPlaeholder.textDidChangeHandler(notification:)), name: .UITextViewTextDidChange, object: nil)
        
        placeholderLabel = UILabel()
        placeholderLabel?.textColor = placeholderColor
        placeholderLabel?.text = placeholder
        placeholderLabel?.textAlignment = .left
        placeholderLabel?.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        placeholderLabel?.font = placeholderFont
        
        var height:CGFloat = placeholderFont.lineHeight
        if let data = placeholderLabel?.text {
            
            let expectedDefaultWidth:CGFloat = bounds.size.width
            
            let textView = UITextView()
            textView.text = data
            textView.font = UIFont.systemFont(ofSize: 14)
            let sizeForTextView = textView.sizeThatFits(CGSize(width: expectedDefaultWidth,
                                                               height: CGFloat.greatestFiniteMagnitude))
            let expectedTextViewHeight = sizeForTextView.height
            
            if expectedTextViewHeight > height {
                height = expectedTextViewHeight
            }
        }
        
        placeholderLabel?.frame = CGRect(x: 5, y: 0, width: bounds.size.width - 16, height: height)
        
        if text.isEmpty {
            addSubview(placeholderLabel!)
            bringSubview(toFront: placeholderLabel!)
        } else {
            placeholderLabel?.removeFromSuperview()
        }
    }
    
    func textDidChangeHandler(notification: Notification) {
        layoutSubviews()
    }
    
}

extension UITextViewPlaeholder : UITextViewDelegate {
    // MARK: - UITextViewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        notifier?.placeholderTextViewDidChangeText(textView.text)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        notifier?.placeholderTextViewDidEndEditing(textView.text)
    }
}
