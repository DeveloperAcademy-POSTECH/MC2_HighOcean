//
//  AppStation.swift
//  HighOcean
//
//  Created by apple on 2023/05/16.
//

import Foundation

final class AppState : ObservableObject {
    @Published var isLogin = false
    @Published var rootViewId = UUID()
    @Published var homeViewId = UUID()
}
