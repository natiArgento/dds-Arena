package dds2014.dominio

import org.uqbar.commons.utils.Observable
import java.util.Date

@Observable
class Nota {
	
	@Property String descripcion
	@Property int fecha
	@Property Boolean estaAprobado = false
	
	new(String desc, int fecha,Boolean aprobacion){
		this.descripcion= desc
		this.fecha= fecha
		this.estaAprobado= aprobacion
	}
	
	
}