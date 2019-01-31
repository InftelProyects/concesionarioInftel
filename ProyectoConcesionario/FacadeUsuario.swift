//
//  FacadeUsuario.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation

class FacadeUsuario{
    
    
    func ValidateUser(usuario : String, contrasena : String ,handler: @escaping (Usuario) -> Void){
        
        let url = URL(string: "http://192.168.1.13:8080/WebServerConcesionario/recursos/usuario/sessionV/\(usuario)/\(contrasena)")!
        
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
                let usuario = Usuario(jsonResponse!)
                print(jsonResponse) //Response result
                print(usuario.nombre)
                handler(usuario)
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func CreateUser() {
        
        let usu = Usuario(nombre: "Francisca", apellidos: "Estancias", usuario: "paquitaSalas", constrasena: "TRES60", rol: "user")
        
        let uploadData = try! JSONEncoder().encode(usu)
        let json = String(data: uploadData, encoding: String.Encoding.utf8)!
        print(json)
        let url = URL(string: "http://192.168.1.13:8080/WebServerConcesionario/recursos/usuario")!
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




