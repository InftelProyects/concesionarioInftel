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
    let bastidor_vehiculo : String
    let img : Data?
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.ruta = dictionary["ruta"] as? String ?? ""
        self.bastidor_vehiculo = dictionary["bastidorVehiculo"] as? String ?? ""
        self.img = dictionary["img"] as? Data!
    }
    
    init(nombre : String, ruta :String, bastidor_vehiculo : String, img : Data?) {
        
        self.nombre = nombre
        self.ruta = ruta
        self.bastidor_vehiculo = bastidor_vehiculo
        self.img = img
     
    }
    
    func describe() -> String{
        return "Bienvenido : \(self.nombre) "
    }
    
}
