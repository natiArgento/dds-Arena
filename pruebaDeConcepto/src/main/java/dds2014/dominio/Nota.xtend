package dds2014.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	
	@Property String descripcion
	@Property String fecha
	@Property Boolean estaAprobado = false
	
	
}