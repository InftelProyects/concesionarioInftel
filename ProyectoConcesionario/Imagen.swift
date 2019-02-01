//
//  Imagenes.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation
import UIKit

class Imagen : Encodable{
    
    let nombre : String
    let ruta : String
    let bastidor : String
    let img : String
    let id : Int?
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.ruta = dictionary["ruta"] as? String ?? ""
        self.bastidor = dictionary["bastidorVehiculo"] as? String ?? ""
        self.img = dictionary["img"] as! String
        self.id = dictionary["id"] as? Int ?? 0
        //self.idusuario = dictionary["idusuario"] as? Int ?? 0
    }
    init(nombre : String, ruta :String, bastidorVehiculo : String, img : String, id : Int?) {
        
        self.nombre = nombre
        self.ruta = ruta
        self.bastidor = bastidorVehiculo
        self.img = img
        self.id = id
        
    }
    
    func describe() -> String{
        return "Bienvenido : \(self.nombre) "
    }
    
}
