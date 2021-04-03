//
//  MockTask.swift
//  Coding_Challange
//
//  Created by Virendra Gupta on 3/16/21.
//

import Foundation

public class MockTask: URLSessionDataTask {
    private let data : Data?
    private let urlResponse: URLResponse?
    public let error: Error?
    
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    
    public override func resume(){
        DispatchQueue.main.async{
            self.completionHandler(self.data, self.urlResponse, self.error)
        }
    }
    
    
}
