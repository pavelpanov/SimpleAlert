//
//  AlertAction.swift
//  SimpleAlert
//
//  Created by Kyohei Ito on 2016/09/12.
//  Copyright © 2016年 kyohei_ito. All rights reserved.
//

@objc
open class AlertAction : NSObject {
    @objc public enum AlertActionStyle : Int {
        case `default`
        case ok
        case cancel
        case destructive
        case twolines
    }
    
    public init(title: String, style: AlertActionStyle, handler: ((AlertAction?) -> Void)? = nil) {
        self.title = title
        self.handler = handler
        self.style = style
    }
    
    public convenience init(title: String, style: AlertActionStyle, dismissesAlert: Bool, handler: ((AlertAction?) -> Void)? = nil) {
        self.init(title: title, style: style, handler: handler)
        self.dismissesAlert = dismissesAlert
    }
    
    var title: String
    var handler: ((AlertAction) -> Void)?
    var style: AlertActionStyle
    var dismissesAlert = true
    open var enabled: Bool = true {
        didSet {
            button?.isEnabled = enabled
        }
    }
    open fileprivate(set) var button: UIButton!
    open fileprivate(set) var label: UILabel!
    
    @nonobjc
    func setButton(_ forButton: UIButton) {
        button = forButton
        button.isEnabled = enabled
    }

    @nonobjc
    func setLabel(_ forTextLabel: UILabel) {
        label = forTextLabel
        let att = NSAttributedString(string: title)
        label.attributedText = att
    }
}
