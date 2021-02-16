//
//  PathLoader.swift
//  Path
//
//  Created by PatrykD on 13/02/2021.
//

import Foundation

protocol PathLoaderType {
    func loadData() throws -> Data?
}

private struct Constants {
    static let fileName = "path"
    static let folderName = "Data"
}

enum PathLoaderError: Error {
    case noFile
}

struct PathLoader: PathLoaderType {
    func loadData() throws -> Data?  {
        guard let path = Bundle.self.main.path(forResource: Constants.fileName, ofType: "json", inDirectory: Constants.folderName)
        else {
            throw PathLoaderError.noFile
        }
        let jsonData = try String(contentsOfFile: path).data(using: .utf8)
        return jsonData
    }
}
