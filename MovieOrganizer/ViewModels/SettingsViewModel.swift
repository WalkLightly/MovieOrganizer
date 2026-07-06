//
//  SettingsViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/5/26.
//

import Foundation
import Observation
internal import Combine

class SettingsViewModel: ObservableObject {
    @Published var folders: [Folder] = []
    @Published var isLoadingFolders: Bool = false
}
