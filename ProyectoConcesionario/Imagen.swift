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
    let img : Data
    let id : Int?
    
    init(_ dictionary: [String: Any]) {
        self.nombre = dictionary["nombre"] as? String ?? ""
        self.ruta = dictionary["ruta"] as? String ?? ""
        self.bastidor = dictionary["bastidor"] as? String ?? ""
        self.img = dictionary["img"] as! Data
        self.id = dictionary["id"] as? Int ?? 0
        //self.idusuario = dictionary["idusuario"] as? Int ?? 0
    }
    
    init(nombre : String, ruta :String, bastidor : String, img : Data, id : Int?) {
        
        self.nombre = nombre
        self.ruta = ruta
        self.bastidor = bastidor
        self.img = img
        self.id = id!
     
    }
    
    func describe() -> String{
        return "Bienvenido : \(self.nombre) "
    }
    
}
