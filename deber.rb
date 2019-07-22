
class Cliente
   attr_accessor :nombre, :contrasena ,:proforma
    def initialize(nombre,contrasena, proforma)
      @nombre =nombre
      @contrasena=contrasena
      @proforma=proforma
    end
    
    def iniciarsesion()
        puts "el usuario inicio sesion"
    end
    
    def recuperaContrasena()
        puts "Su contrasena de cliente recuperada es #{@contrasena}"
    end
    
    def solicitaProforma()
        puts "La proforma ha sido solicitada y es #{@proforma}"
    end
end

cliente1=Cliente.new("Alvaro","1234","dano de tuberia") 
cliente1.iniciarsesion
cliente1.recuperaContrasena
cliente1.solicitaProforma()

class Servicio
    attr_accessor :tarifa ,:descripcion, :esActivo
    def initialize(tarifa, descripcion,esActivo)
        @tarifa=tarifa
        @descripcion=descripcion
        @esActivo=esActivo
    end
    
    def activarServicio()
        if(self.esActivo==false)
            puts "El servicio es inactivo y se habilitara"
            self.esActivo=true
        else
            puts "el servicio ya esta activo"
        end
    end
    
    def desactivarServicio()
        if(self.esActivo==true)
            puts "El servicio esta activo y se deshabilitara"
            self.esActivo=false
        else
            puts "el servicio ya esta desactivado"
        end
    end
    
    def configurarTarifa(nuevatarifa)
        self.tarifa=nuevatarifa
        puts "la nueva tarifa ha sido configurada y es de #{@tarifa} "
    end
end



class Proveedor
    attr_accessor :nombre, :contrasena, :listaServicios
    def initialize(nombre,contrasena,listaServicios)
      @nombre =nombre
      @contrasena=contrasena
      @listaServicios=listaServicios
    end
    
    def agregarServicio(tarifa,descripcion,boolactivo)
        
       return self.listaServicios.push(Servicio.new(tarifa,descripcion,boolactivo))
    end
    def configurarTarifa(servicio,nuevatarifa)
        servicio.tarifa=nuevatarifa
        return servicio
    end
    
    def recuperaContrasena()
        puts "Su contrasena de proveedor recuperada es #{@contrasena}"
    end
    
    def desactivarCuenta()
        puts "Su cuenta de proveedor ha sido desactivada"
    end
    
    def aceptarPropuesta(cliente)
        
        puts "La propuesta es aceptada y es "+ cliente.proforma
    end
end


servicios=[Servicio.new("$15","carpinteria",true)]

servicios[0].activarServicio()
servicios[0].desactivarServicio()
servicios[0].configurarTarifa("$25")
prov1=Proveedor.new("Juan Perez","abcd",servicios) #CreaProveedor con su lista de servicios
puts prov1.listaServicios[0].descripcion
prov1.agregarServicio("$10","servicio de albanileria",true) 
puts prov1.listaServicios[1].descripcion #Descripcion del nuevo servicio
prov1.recuperaContrasena()
prov1.aceptarPropuesta(cliente1)
prov1.desactivarCuenta()

class Administrador
    attr_accessor :nombre, :contrasena, :listausuarios
    def initialize(nombre,contrasena,listausuarios)
       @nombre =nombre
       @contrasena=contrasena
       @listausuarios=listausuarios
       
    end
    
    def iniciarsesion()
        puts "Inicio sesion con usuario "+self.nombre
    end
    
    def actualizarDatosUsuario(user,nuevonombre) #El admin modifica un usuario basado en su nombre
        self.listausuarios.each do |usuario|
            if(user.nombre==usuario.nombre)
                usuario.nombre=nuevonombre
                puts "El usuario ha sido modificado"
            end
        end
    end
    
    def desactivarUsuario(user)
        self.listausuarios.delete(user)
        puts "El usuario ha sido desactivado"
            
    end 
    
    def crearServicio(tarifa,descripcion,boolactivo)
        puts "El servicio se ha creado"
        return Servicio.new(tarifa,descripcion,boolactivo)
    end
    
    def generarReporte()
        puts "El reporte ha sido generado"
    end
end


listaUser=[prov1,cliente1] # Se tiene dos usuarios
prov2=Proveedor.new("Juan Perez","abcd",servicios)
admin=Administrador.new("Juanitoadmin","xyzadmin",listaUser)
admin.actualizarDatosUsuario(prov2,"nuevonombre")
admin.desactivarUsuario(prov1) #Se elimina un usuario prov1
puts admin.listausuarios.count #Ahora el admin tiene un solo usuario
serv2=admin.crearServicio("$20","pintura",true)