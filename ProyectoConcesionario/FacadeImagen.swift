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

    func UploadImage(vehiculo : Vehiculo,imagen : UIImage) {
        
        let imgData  = imagen.jpegData(compressionQuality: 1)!
        let StringData = imgData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        
        let img = Imagen( nombre: vehiculo.modelo, ruta : vehiculo.bastidor, bastidorVehiculo: vehiculo.bastidor, img : StringData , id : nil )
        print (img.bastidor)
        
        let uploadData = try! JSONEncoder().encode(img)
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
    
    func DownloadImage(handler: @escaping (UIImage) -> Void){
        
        let url = URL(string: "http://192.168.249.213:8080/WebServerConcesionario/recursos/imagenes")!
        
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
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    print("Array no se pudo cargar")
                    return
                }
                //print(jsonArray)
                
                var model = [Imagen]() //Inicializo una Array con imagenes
                for dic in jsonArray{
                    model.append(Imagen(dic)) // Añado a cada Imagen sus valores
                }
                if let imageData = Data(base64Encoded: model[2].img as! String),
                    let image = UIImage(data: imageData) {
                    handler(image)}
                /*
                 Para una sola imagen descomentar
                if let encodedImageData = jsonResponse!["img"],
                    let imageData = Data(base64Encoded: encodedImageData as! String),
                    let image = UIImage(data: imageData) {
                    handler(image)
                }*/
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
        
        
    
}
