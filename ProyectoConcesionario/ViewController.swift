//
//  ViewController.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    let facadeUsuario = FacadeUsuario()
    
    @IBOutlet weak var campoUsuario: UITextField!
    @IBOutlet weak var campoContrasena: UITextField!
    @IBAction func contrasena(_ sender: Any) {
       facadeUsuario.startLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

