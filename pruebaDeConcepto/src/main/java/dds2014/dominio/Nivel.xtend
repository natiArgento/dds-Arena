package dds2014.dominio

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Nivel extends Entity {
	@Property String nroCuatri
	@Property String nroNivel
	
	
	def getDescripcion() {
		nroCuatri.concat(nroNivel)
	}

	override def toString() {
		descripcion
	}
	}