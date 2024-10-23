//
//  HomeViewModel.swift
//  Elaborate
//
//  Created by Sam Cross on 10/22/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var homeModel = HomeModel()
    @Published var counter: Int = 0
    
    func buttonPressed() {
        counter += 1
        print(counter)
    }
}
