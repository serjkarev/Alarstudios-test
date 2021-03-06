//
//  NetworkService.swift
//  Alarstudios test
//
//  Created by skarev on 26.08.2020.
//  Copyright © 2020 skarev. All rights reserved.
//

import Foundation

//MARK: - Status
enum Status: String, Error {
    case ok = "ok"
    case error = "error"
    case undefined
}

//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol : class {
    func getAuth(userName: String, password: String, completion: @escaping (Result<Auth?, Error>) -> Void)
    func getItemsFor(code: String?, page: Int, completion: @escaping (Result<Item?, Error>) -> Void)
}

//MARK: - NetworkServiceProtocol
class NetworkService: NetworkServiceProtocol {
    private let scheme = "https"
    private let host = "www.alarstudios.com"
    
    //MARK: - NetworkServiceProtocol methods
    func getAuth(userName: String, password: String, completion: @escaping (Result<Auth?, Error>) -> Void) {
        let path = "/test/auth.cgi"
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = path
        urlComponents.queryItems = [
        URLQueryItem(name: "username", value: userName),
        URLQueryItem(name: "password", value: password)]
        guard let url = urlComponents.url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode(Auth.self, from: data!)
                if obj.status == Status.ok.rawValue {
                    completion(.success(obj))
                } else if obj.status == Status.error.rawValue {
                    completion(.failure(Status.error))
                } else {
                    completion(.failure(Status.undefined))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getItemsFor(code: String?, page: Int, completion: @escaping (Result<Item?, Error>) -> Void) {
        let path = "/test/data.cgi"
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = path
        urlComponents.queryItems = [URLQueryItem(name: "code", value: code),
                                    URLQueryItem(name: "p", value: String(page))]
        guard let url = urlComponents.url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode(Item.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
