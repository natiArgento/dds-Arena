package dds2014.runnable

import dds2014.ui.SeguidorWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class SeguidorDeCarreraApplication extends Application {
	
	static def void main(String[] args) { 
		new SeguidorDeCarreraApplication().start()
	}
	override protected Window<?> createMainWindow() {
		new SeguidorWindow(this)
	}
	
}