//
//  Usuario.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation

class Usuario : Encodable{
    
    let nombre : String
    let apellidos : String
    let usuario : String
    let constrasena : String
    let rol : String
    //let idusuario : Int?
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.apellidos = dictionary["apellidos"] as? String ?? ""
        self.usuario = dictionary["usuario"] as? String ?? ""
        self.constrasena = ""
        self.rol = dictionary["rol"] as? String ?? ""
        //self.idusuario = dictionary["idusuario"] as? Int ?? 0
    }
    
    init(nombre : String, apellidos :String, usuario : String, constrasena : String, rol : String) {
        self.nombre = nombre
        self.apellidos = apellidos
        self.usuario = usuario
        self.constrasena = constrasena
        self.rol = rol
        //self.idusuario = idusuario
    }
    
    func describe() -> String{
        return "Bienvenido : \(self.usuario) "
    }
    /*
    func toJSON() -> [String: Any] {
        let usuJson = " \"usuario\": \(self.nombre), \"apellidos\" : \(self.apellido), \"nombre\":\(self.nombre), \"contrasena\":\(self.contrasena) \"rol\":\(self.rol)"
        return JSONSerialization.dictionaryWithValues(forKeys: usuJson)
    }*/
   
}
