//
//  Services.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 19.04.2024.
//

import Foundation
import NeonSDK

class Services : ObservableObject  {
    
    static func sendRequest(content : String, completion : @escaping (_ responseSpeak : String?) -> ()){
                
        let endpoint = "https://chatgpt-best-price.p.rapidapi.com/v1/chat/completions"
        
        let headers = [
            "content-type": "application/json",
            "X-RapidAPI-Key": "fd5f077fcdmsh7a35e16064fe629p1cbd95jsndb29469245ab",
            "X-RapidAPI-Host": "chatgpt-best-price.p.rapidapi.com"
        ]
        
        let requestBody: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [["role": "user", "content": "\(content)"]],
            "max_tokens": 512,
            "temperature": 0.7,
            "frequency_penalty": 0,
            "presence_penalty": 0,
            "top_p": 1
        ]
        
        guard let postData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: URL(string: endpoint)!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Hiçbir veri alınamadı")
                completion(nil)
                return
            }
            
            do {
                let responseDict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print("Answer: \(responseDict)")
                
                guard let completions = responseDict["choices"] as? [[String: Any]],
                      let message = completions[0]["message"] as? [String: Any],
                      let responseStr = message["content"] as? String else {
                    completion(nil)
                    return
                }
                
                var editedResponse = responseStr.trimmingCharacters(in: .whitespacesAndNewlines)
                editedResponse = editedResponse.replacingOccurrences(of: "AI: ", with: "")
                editedResponse = editedResponse.replacingOccurrences(of: "AI:", with: "")
                completion(editedResponse)
                
            } catch {
                print("JSON ayrıştırma hatası: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
