package dds2014.dominio

import org.uqbar.commons.utils.Observable

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