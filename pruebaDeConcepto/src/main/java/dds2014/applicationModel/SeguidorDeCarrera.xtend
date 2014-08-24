package dds2014.applicationModel

import dds2014.dominio.Materia
import org.uqbar.arena.widgets.List
import org.uqbar.commons.utils.ApplicationContext
import dds2014.dominio.Nivel
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorDeCarrera {
	
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nivel nivelMateria
	@Property List<Nivel> niveles
	
	
	def void init(){
		getHomeMaterias()
		getHomeNivel()
	}
	
	def getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel))
	}
	
	def getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}