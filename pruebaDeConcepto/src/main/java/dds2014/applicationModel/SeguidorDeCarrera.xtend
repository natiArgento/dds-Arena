package dds2014.applicationModel

import dds2014.dominio.Materia
import dds2014.dominio.Nivel
import dds2014.home.HomeMaterias
import java.io.Serializable
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorDeCarrera implements Serializable {
	
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nivel nivelMateria
	@Property List<Nivel> niveles
	
	
	def void actualizarMaterias(){
		materias = getHomeMaterias().getMaterias()	
	}
	
	def actualizarMaterias(Object object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel))
	}
	
	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
}