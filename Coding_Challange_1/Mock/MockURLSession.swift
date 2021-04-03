//
//  MockURLSession.swift
//  Coding_Challange
//
//  Created by Virendra Gupta on 3/16/21.
//

import Foundation

class MockURLSession: URLSession{
    
    private let mockTask: MockTask
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data:data, urlResponse: urlResponse, error:error)
    }
    
    var cachedUrl: URL?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return URLSessionDataTask()
    }

}
