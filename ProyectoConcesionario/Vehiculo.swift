//
//  Vehiculo.swift
//  ProyectoConcesionario
//
//  Created by INFTEL 09 on 31/01/2019.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import Foundation
import UIKit

class Vehiculo : Encodable{
    
    let marca : String
    let modelo : String
    let anio : String
    let puertas : String
    let plazas : String
    let version : String
    let cilindrada : String
    let cambio : String
    let potencia : Int
    let velocidadmax : String
    let consumo : String
    let traccion : String
    let km : String
    let deposito : Int
    let color : String
    let precio : Int
    let combustible : String
    let contaminacion : String
    let aceleracion : String
    let bastidor : String
    
    init(_ dictionary: [String: Any]) {
        self.marca = dictionary["marca"] as? String ?? ""
        self.modelo = dictionary["modelo"] as? String ?? ""
        self.anio = dictionary["anio"] as? String ?? ""
        self.puertas = dictionary["puertas"] as? String ?? ""
        self.plazas = dictionary["plazas"] as? String ?? ""
        self.version = dictionary["version"] as? String ?? ""
        self.cilindrada = dictionary["cilindrada"] as? String ?? ""
        self.cambio = dictionary["cambio"] as? String ?? ""
        self.potencia = dictionary["potencia"] as? Int ?? 0
        self.velocidadmax = dictionary["velocidadmax"] as? String ?? ""
        self.consumo = dictionary["consumo"] as? String ?? ""
        self.traccion = dictionary["traccion"] as? String ?? ""
        self.km = dictionary["km"] as? String ?? ""
        self.deposito = dictionary["deposito"] as? Int ?? 0
        self.color = dictionary["color"] as? String ?? ""
        self.precio = dictionary["precio"] as? Int ?? 0
        self.combustible = dictionary["combustible"] as? String ?? ""
        self.contaminacion = dictionary["contaminacion"] as? String ?? ""
        self.aceleracion = dictionary["aceleracion"] as? String ?? ""
        self.bastidor = dictionary["bastidor"] as? String ?? ""
        
        
    }
    
    init(marca : String, modelo :String, anio : String, puertas : String, plazas :String, version : String, cilindrada : String, cambio :String, potencia : Int, velocidadmax : String, consumo :String, traccion : String, km : String, deposito :Int, color : String, precio : Int, combustible :String, contaminacion : String, aceleracion : String, bastidor :String) {
        
        self.marca = marca
        self.modelo = modelo
        self.anio = anio
        self.puertas = puertas
        self.plazas = plazas
        self.version = version
        self.cilindrada = cilindrada
        self.cambio = cambio
        self.potencia = potencia
        self.velocidadmax = velocidadmax
        self.consumo = consumo
        self.traccion = traccion
        self.km = km
        self.deposito = deposito
        self.color = color
        self.precio = precio
        self.combustible = combustible
        self.contaminacion = contaminacion
        self.aceleracion = aceleracion
        self.bastidor = bastidor
        
}

}
