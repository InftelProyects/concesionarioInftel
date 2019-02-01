//
//  File.swift
//  inftelConcesionario
//
//  Created by INFTEL 07 on 01/02/2019.
//  Copyright © 2019 INFTEL 07. All rights reserved.
//

import Foundation
import UIKit

class Coche {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var marca: String
    var modelo: String
    var anio: String
    var km: String
    var plazas: String
    var potencia: String
    var precio: String
    
    init?(name: String, photo: UIImage?, marca: String,modelo: String,anio: String,km: String,plazas: String,potencia: String, precio:String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty ||  marca.isEmpty  || modelo.isEmpty || anio.isEmpty || plazas.isEmpty || potencia.isEmpty || km.isEmpty || precio.isEmpty{
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.marca = marca
        self.modelo = modelo
        self.anio = anio
        self.km = km
        self.plazas = plazas
        self.potencia = potencia
        self.precio = precio
        
        
    }
    
}
