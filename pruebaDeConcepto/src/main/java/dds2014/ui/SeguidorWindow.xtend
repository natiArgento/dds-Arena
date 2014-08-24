package dds2014.ui

import dds2014.applicationModel.SeguidorDeCarrera
import dds2014.dominio.Materia
import dds2014.dominio.Nota
import dds2014.home.HomeMaterias
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

class SeguidorWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
		this.setTitle = "Seguidor de Carrera"
	}

	override createContents(Panel mainPanel) {
		var Panel formPanel
		var Label lblTitulo = new Label(mainPanel)
		lblTitulo.text = "Seguidor de carrera"
		lblTitulo.setFontSize(18)

		//lblTitulo.onLeft
		formPanel = new Panel(mainPanel)
		formPanel.setLayout(new HorizontalLayout)
		addListaMaterias(formPanel)
		addDatosMateria(formPanel)

	//createFormPanel(mainPanel)
	}

	def addListaMaterias(Panel panel) {
		var panelListaMaterias = new Panel(panel)

		panelListaMaterias.setLayout(new VerticalLayout)
		new Label(panelListaMaterias).text = "Materias"
		
		var lista = new List<Object>(panelListaMaterias) => [heigth = 200 width = 125]
		lista.bindValueToProperty("materiaSeleccionada")
		var propiedad = lista.bindItems(new ObservableProperty(homeMaterias, "materias"))
		propiedad.adapter = new PropertyAdapter(typeof(Materia), "nombre")
		
			
		new Button(panelListaMaterias) => [caption = "Nueva materia" width = 65 onClick[|this.agregarMateria()]]
	}
	
	def getHomeMaterias() {
		ApplicationContext::instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
	
	
	def void agregarMateria() {
		this.openDialog(new NuevaMateriaWindow(this, new Materia))
	}

	override protected createFormPanel(Panel mainPanel) {
		addActions(mainPanel)
	}
	
	def addDatosMateria(Panel panel) {
		var panelDatosMateria = new Panel(panel)
		new Label(panelDatosMateria) => [text = "Nombre materia" setFontSize(12)]

		var subPanel1 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(4))
		new Label(subPanel1).text = "Año cursada:"
		new TextBox(subPanel1).width = 30
		new CheckBox(subPanel1)
		new Label(subPanel1).text = "Final Aprobado"

		var subPanel2 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(2))
		new Label(subPanel2).text = "Profesor de cursada"
		new TextBox(subPanel2).width = 160
		new Label(subPanel2).text = "Ubicación materia"
		new Selector(subPanel2).width = 145
		new Label(subPanel2).text = "Notas de cursada"

		this.createTablaNotas(panelDatosMateria)

		var subPanel3 = new Panel(panelDatosMateria).setLayout(new HorizontalLayout)

		new Button(subPanel3) => [caption = "Editar" width = 80]
		new Button(subPanel3) => [caption = "+" width = 80]
		new Button(subPanel3) => [caption = "-" width = 80]
	}

	def createTablaNotas(Panel panel) {
		var notas = new Table<Nota>(panel, typeof(Nota))
		notas.width = 270
		notas.heigth = 60
		new Column<Nota>(notas).setTitle("Fecha")	
		new Column<Nota>(notas).setTitle("Descripcion")
		new Column<Nota>(notas)
			.setTitle("Aprobado")
			.bindContentsToTransformer([nota | if (nota.estaAprobado) "SI" else "NO"])
	}

	override protected addActions(Panel actionsPanel) {
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|this.modelObject]
		dialog.open
	}
}
