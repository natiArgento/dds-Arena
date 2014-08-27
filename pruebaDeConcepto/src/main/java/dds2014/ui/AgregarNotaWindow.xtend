package dds2014.ui

import dds2014.dominio.Materia
import dds2014.dominio.Nota
import org.uqbar.arena.windows.WindowOwner

class AgregarNotaWindow extends EditarNotaWindow {
	
	
	@Property Materia materia
	
	new(WindowOwner parent, Materia contenedora) {
		super(parent, new Nota)
		materia = contenedora
		this.setTitle = "Agregar Nota"
	}
	
	override executeTask() {
		materia.nuevaNota(modelObject)
		super.executeTask()
	}

	
	
}