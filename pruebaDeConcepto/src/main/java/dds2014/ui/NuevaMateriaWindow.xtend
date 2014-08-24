package dds2014.ui

import dds2014.dominio.Materia
import dds2014.home.HomeMaterias
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

class NuevaMateriaWindow extends Dialog<Materia> {
	new(WindowOwner owner) {
		super(owner, new Materia)
		this.setTitle = "Nueva Materia"
	}
	
	override createFormPanel(Panel mainPanel) {
		new Label (mainPanel).text = "Nombre:"
		new TextBox(mainPanel) => [
		width = 150
		bindValueToProperty ("nombre")
		]
	}
	
	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar" 
			width = 80
			onClick[|this.accept()]
		]
		new Button(actions) => [
			caption = "Cancelar" 
			width = 80
			onClick[|this.cancel()]
		]
				
	}
	
	override executeTask() {
		getHomeMaterias.create(modelObject)
		super.executeTask()
	}
	
	def getHomeMaterias (){
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
	
}