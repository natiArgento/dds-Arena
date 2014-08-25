package dds2014.ui

import org.uqbar.arena.windows.Dialog
import dds2014.dominio.Nota
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import dds2014.home.HomeNotas
import org.uqbar.commons.utils.ApplicationContext

class EditarNotaWindow extends Dialog<Nota> {

	//var Nota original
	
	new(WindowOwner parent, Nota model) {
		super(parent, model)
		//original = modelObject.clone() as Nota	
	}

	override createFormPanel(Panel mainPanel) {
		this.setTitle = "Editar Nota"
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
	
		new Label(panel).text = "Fecha:"
		new TextBox(panel) => [width = 70 bindValueToProperty("fecha")]
		new Label(panel).text = "Descripción:"
		new TextBox(panel) => [width = 80 bindValueToProperty("descripcion")]
		new CheckBox(panel).bindValueToProperty("estaAprobado")
		new Label(panel).text = "Aprobado"
	
	}

override addActions(Panel actions){
	/*new Button(actions)
			.setCaption("Volver")
			.onClick [|this.close]*/
			
			new Button(actions) //
			.setCaption("Aceptar")
			.onClick [|this.accept]
			.setAsDefault.disableOnError
	
}

def getHomeNotas() {
		ApplicationContext.instance.getSingleton(typeof(Nota)) as HomeNotas
	}

	
}