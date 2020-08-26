//
//  NetworkService.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol : class{
    func getAuth(completion: @escaping (Result<Auth?, Error>) -> Void)
    func getItems(completion: @escaping (Result<[Item]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getAuth(completion: @escaping (Result<Auth?, Error>) -> Void) {
        
    }
    
    func getItems(completion: @escaping (Result<[Item]?, Error>) -> Void) {
        
    }
}
