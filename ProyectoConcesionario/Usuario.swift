//
//  Usuario.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation

class Usuario{
    
    let nombre : String
    let apellido : String
    let usuario : String
    let contrasena : String
    let rol : String
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.apellido = dictionary["apellido"] as? String ?? ""
        self.usuario = dictionary["usuario"] as? String ?? ""
        self.contrasena = ""
        self.rol = dictionary["rol"] as? String ?? ""
    }
   
}
