package dds2014.runnable

import dds2014.dominio.Materia
import dds2014.home.HomeMaterias
import dds2014.ui.SeguidorWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext

class SeguidorDeCarreraApplication extends Application {
	
	static def void main(String[] args) { 
		new SeguidorDeCarreraApplication().start()
	}
	override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMaterias)
		new SeguidorWindow(this)
	}
	
}