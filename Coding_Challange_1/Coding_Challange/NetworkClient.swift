//
//  NetworkClient.swift
//  Coding_Challange
//
//  Created by Virendra Gupta on 3/15/21.
//

import Foundation

/*

let endPoint = "https://us-central1-fcg-dev-10.cloudfunctions.net/AuctionDetails"

let session = URLSession.shared
let url = URL(endPoint)

let task = session.dataTa*/

class Auction: Codable {
  let id: String
  let title: String
  let description : String
  let end : Int
  let action: String
}
public class APIRepository {
   
    var session: URLSession!
    
    func getAuction(completion: @escaping ([Auction]?, Error?) -> Void) {
        guard let url = URL(string:"https://us-central1-fcg-dev-10.cloudfunctions.net/AuctionDetails") else {
            fatalError()
        }
        session.dataTask(with: url) { (_, _, _) in }
  }
}
