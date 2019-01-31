//
//  Imagenes.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation
class Imagenes{
    
    let nombre : String
    let ruta : String
    let bastidor : String
    let id : String
    let img : Data?
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.ruta = dictionary["ruta"] as? String ?? ""
        self.bastidor = dictionary["bastidor"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        self.img = dictionary["rol"] as? Data!
    }
    
    func describe() -> String{
        return "Bienvenido : \(self.nombre) "
    }
    
}
