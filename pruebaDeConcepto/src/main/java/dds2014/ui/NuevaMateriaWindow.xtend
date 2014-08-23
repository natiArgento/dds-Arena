package dds2014.ui

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import dds2014.dominio.Materia
import org.uqbar.arena.widgets.Button

class NuevaMateriaWindow extends Dialog<Materia> {
	new(WindowOwner parent, Materia model) {
		super(parent, model)
		this.setTitle = "Nueva Materia"
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label (mainPanel).text = "Nombre:"
		new TextBox(mainPanel).width = 150
		new Button(mainPanel) => [caption = "Aceptar" width = 80]
	}
}