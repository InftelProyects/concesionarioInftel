//
//  FacadeVehiculo.swift
//  ProyectoConcesionario
//
//  Created by INFTEL 09 on 31/01/2019.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation
import UIKit

class FacadeVehiculo{
    
    func UploadVehiculo(vehiculo : Vehiculo)  {
        
        
        let uploadData = try! JSONEncoder().encode(vehiculo)
        let json = String(data: uploadData, encoding: String.Encoding.utf8)!
        //print(json)
        let url = URL(string: "http://192.168.224.152:8080/WebServerConcesionario/recursos/vehiculo")!
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
            if
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
        
    }
    
    func DownloadCoches(handler: @escaping (Array) -> Void){
        
        let url = URL(string: "http://192.168.224.152:8080/WebServerConcesionario/recursos/vehiculo")!
        
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
                    dataResponse, options: [])
               // print(jsonResponse)
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                
                var model = [Vehiculo]() //Inicializo una Array con los coches
                for dic in jsonArray{
                    model.append(Vehiculo(dic)) // Añado a cada coche sus valores y lo inserto en el array
                }
                /*
                print("EL BASTIDOR ES: " + model[0].bastidor)
                print("EL BASTIDOR ES: " + model[1].bastidor)
                print("EL BASTIDOR ES: " + model[2].bastidor)*/
                //Devuelvo el array
                handler(model)
               
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    
}

