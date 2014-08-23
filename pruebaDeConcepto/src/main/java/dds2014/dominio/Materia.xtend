package dds2014.dominio

import dds2014.excepciones.UserException
import org.uqbar.commons.utils.Observable

@Observable
class Materia implements Cloneable {
@Property String nombre
@Property int anioCursada
@Property Boolean estaAprobada = false
@Property String profesor
@Property Nota notas

def validar(){
if (nombre == null){
	
throw new UserException("Debe ingresar nombre de materia")
}
}
}