//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Valeriya Trofimova on 03.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration: String, CaseIterable {
    
    case firstURL = "https://swapi.dev/api/people/8"
    case secondURL = "https://swapi.dev/api/starships/3"
    case thirdURL = "https://swapi.dev/api/planets/5"
    
    public init?(rawValue: RawValue) {
        switch(rawValue) {
        case "https://swapi.dev/api/people/8":
            self = .firstURL
        case "https://swapi.dev/api/starships/3":
            self = .secondURL
        case "https://swapi.dev/api/planets/5":
            self = .thirdURL
        default:
            self = .thirdURL
        }
    }
}
