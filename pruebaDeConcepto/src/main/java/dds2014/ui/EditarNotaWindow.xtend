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

class EditarNotaWindow extends Dialog<Nota> {

	new(WindowOwner parent, Nota model) {
		super(parent, model)
		this.setTitle = "Editar Nota"
		/*var original = model.clone() as Nota*/
	}

	override createFormPanel(Panel mainPanel) {
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		new Label(panel).text = "Fecha:"
		val text= new TextBox(panel)
		text.width= 64
		text.bindValueToProperty("fecha")
		
		new Label(panel).text = "Descripción:"
		new TextBox(panel).bindValueToProperty("descripcion")
		
		new CheckBox(panel)
		new Label(panel).text = "Aprobado"
		
		
		
	}

override addActions(Panel actions){
	new Button(actions)
			.setCaption("Volver")
			.onClick [|this.close]
			
			new Button(actions) //
			.setCaption("Aceptar")
			/* TODO: guardar cambios
			]*/
	
}
}