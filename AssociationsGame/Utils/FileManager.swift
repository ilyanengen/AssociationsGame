//
//  FileManager.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 10.04.2022.
//

import Foundation

class ResultsFileManager {
    
    // MARK: - Public methods
    
    func addResultToFile(_ result: String) {
        if let existingResultsString = getResultsFromFile() {
            let updatedResults = existingResultsString + ",\n" + result
            saveResultsToFile(updatedResults)
        } else {
            saveResultsToFile(result)
        }
    }
    
    func getResultsFromFile() -> String? {
        let filenameUrl = getDocumentsDirectoryFileUrl()
        print("filenameUrl = \(filenameUrl)")
        guard FileManager.default.fileExists(atPath: filenameUrl.path) else {
            print("ERROR! Failed to load results from .txt file")
            return nil
        }
        return try? String(contentsOf: filenameUrl)
    }
    
    // MARK: - Private methods
    
    private func saveResultsToFile(_ results: String) {
        let filenameUrl = getDocumentsDirectoryFileUrl()
        do {
            try results.write(to: filenameUrl, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("ERROR! Failed to save results to .txt file")
        }
    }
    
    private func getDocumentsDirectoryFileUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = paths[0]
        let filenameUrl = url.appendingPathComponent("results.txt")
        return filenameUrl
    }
}
