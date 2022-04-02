//
//  PostView + extension.swift
//  Navigation
//
//  Created by Valeriya Trofimova on 18.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

extension PostView {
    
    func makeTextField() -> UITextField {
            let field = UITextField()
            field.placeholder = "Введите текст"
            field.addTarget(self, action: #selector(textEdited(_:)), for: .editingChanged)
            field.layer.cornerRadius = 8
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.lightGray.cgColor
            field.translatesAutoresizingMaskIntoConstraints = false
            
            return field
        }()
        
        
    }
    
    
    
}
