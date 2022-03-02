//
//  BaseViewModel.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

protocol BaseViewModel {
    var event: ((ViewModelEvent) -> Void)? { get }
    func startSynching()
}

extension BaseViewModel {
    func emit(_ event: ViewModelEvent) {
        self.event?(event)
    }
}

enum ViewModelEvent {
    case loading
    case updateDataModel
    case error(message: String)
}
