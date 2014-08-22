package dds2014.ui

import dds2014.applicationModel.SeguidorDeCarrera
import dds2014.runnable.SeguidorDeCarreraApplication
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class SeguidorWindow extends SimpleWindow<SeguidorDeCarrera> {
	
	
	
	new(WindowOwner owner) {
		super(owner, new SeguidorDeCarrera)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de Carrera"
		super.createMainTemplate(mainPanel)
		
	}
	
	override createContents(Panel mainPanel) {
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}