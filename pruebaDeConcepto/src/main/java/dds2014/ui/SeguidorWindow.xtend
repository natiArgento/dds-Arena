package dds2014.ui

import dds2014.applicationModel.SeguidorDeCarrera
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class SeguidorWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
		setTitle = "Seguidor de Carrera"
	}

	override createMainTemplate(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)

		new Label(mainPanel).text = "Seguidor de Carrera"

		createFormPanel(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		addPanelMaterias(mainPanel)
		addActions(mainPanel)

	}

	def addPanelMaterias(Panel mainPanel) {
		var panelDeMaterias = new Panel(mainPanel)
		panelDeMaterias.setLayout(new ColumnLayout(2))

		addListaMaterias(panelDeMaterias)
		addDatosMateria(panelDeMaterias)
	}

	def addListaMaterias(Panel panel) {
		var panelListaMaterias = new Panel(panel)

		new Label(panelListaMaterias).text = "Materias"

		new List<Object>(panelListaMaterias)

	}

	def addDatosMateria(Panel panel) {

		var panelDatosMateria = new Panel(panel)
		panelDatosMateria.setLayout(new VerticalLayout)

		new Label(panelDatosMateria).text = "Nombre materia"

		var subPanel1 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(4))
		new Label(subPanel1).text = "Año cursada"
		new TextBox(subPanel1)
		new CheckBox(subPanel1)
		new Label(subPanel1).text = "Final Aprobado"

		var subPanel2 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(2))

		new Label(subPanel2).text = "Profesor de cursada"
		new TextBox(subPanel2)

		new Label(subPanel2).text = "Ubicación materia"
		new Selector(subPanel2)

		new Label(subPanel2).text = "Notas de cursada" 
		this.createTablaNotas(panelDatosMateria)

	}

	def createTablaNotas(Panel panel) {
		var notas = new Table<Object>(panel)
		this.contenido(notas)
	}

	def void contenido(Table<Object> notas) {

		new Column<Object>(notas).setTitle("Fecha")

		new Column<Object>(notas).setTitle("Descripcion")

		new Column<Object>(notas).setTitle("Aprobado")

	}

	override protected addActions(Panel actionsPanel) {
		
	
	}

}
