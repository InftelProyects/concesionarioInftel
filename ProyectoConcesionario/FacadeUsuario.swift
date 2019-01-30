//
//  FacadeUsuario.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation

class FacadeUsuario{
    
    func startLoad(){
        
        let url = URL(string: "http://192.168.236.151:8080/ConcesionarioWebServer/recursos/usuario/sessionV/Zerpa12/123456")!
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
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}




