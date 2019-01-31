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
    let facadeImagen = FacadeImagen()
    
    
    
    @IBOutlet weak var campoUsuario: UITextField!
    @IBOutlet weak var campoContrasena: UITextField!
    @IBOutlet weak var labelNameUser: UILabel!
    @IBOutlet weak var VistaImage: UIImageView!
    
    
    
    
    @IBAction func botonRegistro(_ sender: Any) {
        facadeUsuario.CreateUser()
    }
    
    @IBAction func contrasena(_ sender: Any) {
        facadeUsuario.ValidateUser(usuario : campoUsuario.text!, contrasena : campoContrasena.text!) { usuario in
            DispatchQueue.main.async {
               self.labelNameUser.text = usuario.describe() 
            }
         
        }
    }
    
    @IBAction func subirFoto(_ sender: Any) {
        
            facadeImagen.encodeData()
            facadeImagen.UploadImage()
        
    }
    
    @IBAction func SacarImgen(_ sender: Any) {
        //facadeImagen.encodeData()
        facadeImagen.DownloadImage(bastidor: "3101"){ img in
            DispatchQueue.main.async {
                self.VistaImage.image = img
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

