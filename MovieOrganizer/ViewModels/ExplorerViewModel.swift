//
//  ExplorerViewModel.swift
//  MovieOrganizer
//
//  Created by Michael Knight on 7/10/26.
//

import Foundation
import Observation
internal import Combine

class ExplorerViewModel: ObservableObject {
    @Published var folders: [Folder] = []
    @Published var isLoadingFolders: Bool = false
    
    init () {
        Task {
            try await getFoldersForExplorerView()
        }
    }
    
    func getFoldersForExplorerView() async throws -> Void {
        
        self.isLoadingFolders = true
        do {
            self.folders = try await ExplorerAPI.shared.getAllFolders()
            
           // self.folders.sort { $0.name < $1.name }
            self.isLoadingFolders = false
        } catch {
            print("error found while loading folders")
        }
    }
}
