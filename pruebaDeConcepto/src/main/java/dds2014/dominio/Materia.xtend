package dds2014.dominio

import dds2014.excepciones.UserException

class Materia implements Cloneable {
@Property String nombre
@Property int anioCursada
@Property Boolean estaAprobada = false
@Property String profesor
def validar(){
if (nombre == null){
	
throw new UserException("Debe ingresar nombre de materia")
}
}
}