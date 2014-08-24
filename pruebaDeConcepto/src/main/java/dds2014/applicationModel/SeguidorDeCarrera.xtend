package dds2014.applicationModel

import dds2014.dominio.Materia
import org.uqbar.arena.widgets.List
import org.uqbar.commons.utils.ApplicationContext

class SeguidorDeCarrera {
	
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	
	def void init(){
		getHomeMaterias()
	}
	
	def getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}