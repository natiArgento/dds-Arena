package dds2014.dominio

import org.uqbar.commons.utils.Observable

@Observable
class Nivel {
	@Property String nroCuatri
	@Property String nroNivel
	
	
	def getDescripcion() {
		nroCuatri.concat(nroNivel)
	}

	override def toString() {
		descripcion
	}
	}