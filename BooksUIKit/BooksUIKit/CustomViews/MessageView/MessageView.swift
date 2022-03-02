//
//  MessageView.swift
//  Populaw
//
//  Created by Gaurang on 23/11/21.
//

import UIKit

class MessageView: UIView {
   
    @IBOutlet weak var messageLabel: UILabel!

    static func getInstance(_ message: String) -> MessageView {
        let messageView: MessageView = fromNib()
        messageView.messageLabel.text = message
        return messageView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
