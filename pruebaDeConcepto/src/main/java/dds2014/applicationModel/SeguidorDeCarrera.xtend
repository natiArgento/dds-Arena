package dds2014.applicationModel

import dds2014.dominio.Materia
import dds2014.dominio.Nivel
import dds2014.dominio.Nota
import dds2014.home.HomeMaterias
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import dds2014.home.HomeNivel
import dds2014.home.HomeNotas

@Observable
class SeguidorDeCarrera implements Serializable {

	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nivel nivelMateria
	@Property List<Nivel> niveles
	@Property Nota notaSeleccionada
	@Property Integer fecha
	@Property Boolean estaAprobado
	@Property String descripcion
	@Property List<Nota> resultados

	def void actualizarMaterias() {
		materias = new ArrayList<Materia>
		materias = getHomeMaterias().getMaterias()
	}

	def actualizarMaterias(Object object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def HomeNivel getHomeNivel() {
		ApplicationContext.instance.getSingleton(typeof(Nivel))
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}

	def HomeNotas getHomeNotas() {
		ApplicationContext.instance.getSingleton(typeof(Nota))

	}

	def void clear() {
		descripcion = null
		fecha = null
		estaAprobado = null
	}

	def void eliminarNotaSeleccionada() {
		getHomeNotas().delete(notaSeleccionada)
		this.search()
		notaSeleccionada = null
	}

	def void search() {

		resultados = new ArrayList<Nota>

		resultados = homeNotas.search(descripcion, fecha, estaAprobado)

	// también se puede llamar homeCelulares.search(numero, nombre) 
	}

}
