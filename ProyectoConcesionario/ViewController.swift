//
//  ViewController.swift
//  ProyectoConcesionario
//
//  Created by Antonio Recio Arco on 30/1/19.
//  Copyright © 2019 Antonio Recio Arco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {
    
    let facadeUsuario = FacadeUsuario()
    let facadeImagen = FacadeImagen()
    let facadeVehiculo = FacadeVehiculo()
    
    
    
    @IBOutlet weak var campoUsuario: UITextField!
    @IBOutlet weak var campoContrasena: UITextField!
    @IBOutlet weak var labelNameUser: UILabel!
    @IBOutlet weak var VistaImage: UIImageView!
    
    @IBOutlet weak var bastidor: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Esta funcion indica al sistema que debe responder cuando el usuario hace click en "Enter" o en "Done"
        //Además renuncia a la primera respueta "resignFirstResponder" que se genera cuando el usuario hace click en el campo de texto
        bastidor.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Justo despues de llamar a textFieldSouldReturn e idicarle en ella que se renuncia a la primera llamada, el sistema llama a textFieldDidEndEditing
        //Esta funcion toma el texto que se ha escrito en el campo de texto y lo asigna al label
        bastidor.text = textField.text
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Si el usuario hace click en la imagen mientras es ecribe en el campo de texto.. el tecaldo desaparecerá
        bastidor.resignFirstResponder()
        //creamos el controlador para acceder a la libreria de fotos
        let imagePickerController = UIImagePickerController()
        
        //accedemos a al carrete de fotos el sistema
        imagePickerController.sourceType = .photoLibrary
        
        //Notifica a ViewController que el usuario ha elegido una imagen
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //as? es un tipo de condicional:
        //si info contiene una imagen al desempaquetar el opcional "info" lo guarda en selectedImage
        //si al desempaquetarlo no se encuantra lo esperado.. retornara un error
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        //asigna la imangen
        VistaImage.image = selectedImage
        
        //destruye finalmente el recolector de imagenes
        dismiss(animated: true, completion: nil)
    }
    
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
            let coche = Vehiculo(marca : "String", modelo :"String", anio : "String", puertas : "String", plazas :"String", version : "String", cilindrada : "String", cambio :"String", potencia : 110, velocidadmax : "String", consumo :"String", traccion : "String", km : "String", deposito : 40, color : "String", precio : 10, combustible :"String", contaminacion : "String", aceleracion : "String", bastidor :bastidor.text!)
            
            facadeImagen.UploadImage(vehiculo: coche, imagen: UIImage(named: "coche3")!)
        
    }
    
    @IBAction func SacarImgen(_ sender: Any) {
        //facadeImagen.encodeData()
        facadeImagen.DownloadImage(bastidor: "5701"){ img in
            DispatchQueue.main.async {
                self.VistaImage.image = img
            }
        }
    }
    
    @IBAction func AnadirCoche(_ sender: Any) {
        let coche = Vehiculo(marca : "String", modelo :"String", anio : "String", puertas : "String", plazas :"String", version : "String", cilindrada : "String", cambio :"String", potencia : 110, velocidadmax : "String", consumo :"String", traccion : "String", km : "String", deposito : 40, color : "String", precio : 10, combustible :"String", contaminacion : "String", aceleracion : "String", bastidor :bastidor.text!)
        
        facadeVehiculo.UploadVehiculo(vehiculo :coche)
        facadeImagen.UploadImage(vehiculo: coche, imagen: UIImage(named: "coche3")!)
        
        
    }
    
    @IBAction func Listarcoches(_ sender: Any) {
        facadeVehiculo.DownloadCoches()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bastidor.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

