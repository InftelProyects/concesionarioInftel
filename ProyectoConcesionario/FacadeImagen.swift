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

    
    
    func UploadImage() {
        
        
        let img = Imagen(nombre :"CitroenC3", ruta : "escritorio", bastidorVehiculo : "w006av" , img : profileImage.pngData())
        
        let uploadData = try! JSONEncoder().encode(img)
        let json = String(data: uploadData, encoding: String.Encoding.utf8)!
        //print(json)
        let url = URL(string: "http://192.168.1.13:8080/WebServerConcesionario/recursos/imagenes")!
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
    
    
}
