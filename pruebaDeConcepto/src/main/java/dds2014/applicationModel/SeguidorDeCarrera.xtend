package dds2014.applicationModel

import dds2014.dominio.Materia
import dds2014.dominio.Nivel
import dds2014.dominio.Nota
import dds2014.home.HomeMaterias
import dds2014.home.HomeNivel
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorDeCarrera implements Serializable {

	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nivel nivelMateria
	@Property List<Nivel> niveles
	@Property Nota notaSeleccionada
	
	

	def void actualizarMaterias() {
		materias = new ArrayList<Materia>
		materias = getHomeMaterias().getMaterias()
	}

	def HomeNivel getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel))
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}

	
	def void eliminarNotaSeleccionada() {
		materiaSeleccionada.eliminar(notaSeleccionada)
		notaSeleccionada = null
		actualizarPantalla
		
	}

		
	def actualizarPantalla(){
		var aux=materiaSeleccionada
		actualizarMaterias
		actualizarMaterias
		materiaSeleccionada=aux
		
	}

}
