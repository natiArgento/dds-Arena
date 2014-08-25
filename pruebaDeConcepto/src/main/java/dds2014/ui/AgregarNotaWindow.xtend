package dds2014.ui

import org.uqbar.arena.windows.WindowOwner
import dds2014.dominio.Nota

class AgregarNotaWindow extends EditarNotaWindow {
	
	new(WindowOwner parent, Nota model) {
		super(parent, model)
		this.setTitle = "Agregar Nota"
	}
	
	
}