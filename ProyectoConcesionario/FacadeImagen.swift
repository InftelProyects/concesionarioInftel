//
//  FacadeImagenes.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 31/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation
import UIKit

class FacadeImagen{
    
    let profileImage = UIImage(named:"coche1")!
    var dataImage : Any?

    
    func encodeData(){
        dataImage = profileImage.pngData()
    }

    
    
    func UploadImage() {
        
        
        let uploadData = try! JSONEncoder().encode(imagen)
        let json = String(data: uploadData, encoding: String.Encoding.utf8)!
        //print(json)
        let url = URL(string: "http://192.168.224.152:8080/WebServerConcesionario/recursos/imagenes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
        
        
    }
    
    func DownloadImage(bastidor : String ,handler: @escaping (UIImage) -> Void){
        
        let url = URL(string: "http://192.168.224.152:8080/WebServerConcesionario/recursos/imagenes/\(bastidor)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print(response)
                    return
            }
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as? [String: Any]
                
                if let encodedImageData = jsonResponse!["img"],
                    let imageData = Data(base64Encoded: encodedImageData as! String),
                    let image = UIImage(data: imageData) {
                    handler(image)
                }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
        
        
    
}
