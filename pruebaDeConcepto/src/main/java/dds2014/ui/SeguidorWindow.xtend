package dds2014.ui

import dds2014.applicationModel.SeguidorDeCarrera
import dds2014.dominio.Materia
import dds2014.dominio.Nivel
import dds2014.dominio.Nota
import dds2014.home.HomeMaterias
import dds2014.home.HomeNivel
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
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

class SeguidorWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
		//Titulo
		this.setTitle = "Seguidor de Carrera"
		//Cargar lista de materias
		modelObject.actualizarMaterias
	}

	override createContents(Panel mainPanel) {
		//Panel principal
		var Panel formPanel
		new Label(mainPanel) => [
			text = "Seguidor de carrera"
			setFontSize(18)
		]		
		formPanel = new Panel(mainPanel)
		formPanel.setLayout(new HorizontalLayout)
		addListaMaterias(formPanel)
		addDatosMateria(formPanel)
		new ErrorsPanel(mainPanel, "Listo para buscar cualquier materia que vengaaaaa")
	}

	def addListaMaterias(Panel panel) {
		var panelListaMaterias = new Panel(panel)
		panelListaMaterias.setLayout(new VerticalLayout)

		//MATERIAS: LISTA DE MATERIAS
		new Label(panelListaMaterias).text = "Materias"
		var lista = new List<Object>(panelListaMaterias) => [
			heigth = 200 
			width = 125
		]
		lista.bindValueToProperty("materiaSeleccionada")
		//bindeo la lista con la propiedad NOMBRE de las materias	
		var propiedad = lista.bindItems(new ObservableProperty(modelObject, "materias"))
		propiedad.adapter = new PropertyAdapter(typeof(Materia), "nombre")
	
		//NUEVA MATERIA
		new Button(panelListaMaterias) => [
			caption = "Nueva materia" 
			width = 65 
			onClick[|this.crearMateria()]
		]
	}

	//???????????????????????
	override protected createFormPanel(Panel mainPanel) {
		addActions(mainPanel)
	}

	def addDatosMateria(Panel panel) {
	var panelDatosMateria = new Panel(panel)

//		NOMBRE MATERIA (NO EDITABLE)
		new Label(panelDatosMateria) => [ 
			setFontSize(12)
			bindValueToProperty("materiaSeleccionada.nombre")
		]

	var subPanel1 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(4))
		
//		AÑO CURSADA(Editable con txt)
		new Label(subPanel1).text = "Año cursada:"
		new TextBox(subPanel1) => [
			width = 30
			bindValueToProperty("materiaSeleccionada.anioCursada")			
		]
		
//		APROBADO. Check
		new CheckBox(subPanel1)
			.bindValueToProperty("materiaSeleccionada.estaAprobada")
		new Label(subPanel1).text = "Final Aprobado"
		

	var subPanel2 = new Panel(panelDatosMateria).setLayout(new ColumnLayout(2))

//		PROFESOR: (editable. txt)
		new Label(subPanel2).text = "Profesor de cursada"
		new TextBox(subPanel2) => [
			bindValueToProperty("materiaSeleccionada.profesor")
			width = 160
		]
		
//		Nivel Materia. SELECTOR
		new Label(subPanel2).text = "Ubicacion materia"
		var selectorNivel = new Selector(subPanel2)
		selectorNivel.width = 145
		selectorNivel.allowNull(true)
//		Dandole las propiedades
		selectorNivel.bindValueToProperty("materiaSeleccionada.nivelMateria.descripcion")
		var propiedadNiveles = selectorNivel.bindItems(new ObservableProperty(homeNivel, "niveles"))
		propiedadNiveles.adapter = new PropertyAdapter(typeof(Nivel), "descripcion")

//		NOTAS
		new Label(subPanel2).text = "Notas de cursada"

//		TABLA DE NOTAS
		this.createTablaNotas(panelDatosMateria)

	var subPanel3 = new Panel(panelDatosMateria).setLayout(new HorizontalLayout)
		
//		ACCIONES SOBRE TABLA DE NOTAS
		new Button(subPanel3) => [caption = "Editar" width = 80 onClick[|this.editarNota()]]
		new Button(subPanel3) => [caption = "+" width = 80 onClick [|this.agregarNota()]]
		new Button(subPanel3) => [caption = "-" width = 80 onClick [ | modelObject.clear /*o elminarNotaSeleccionada*/ ]]
	}
	
	def elminarNotaSeleccionada() {
		modelObject.materiaSeleccionada.eliminar(modelObject.notaSeleccionada)
	}
	
	

	def createTablaNotas(Panel panel) {
//		CREANDO TABLA DE NOTAS
		var notas = new Table<Nota>(panel, typeof(Nota))
		notas.width = 270
		notas.heigth = 60
		notas.bindItemsToProperty("materiaSeleccionada.notas")
		notas.bindValueToProperty("notaSeleccionada")
		
//		BINDEANDO COLUMNAS
		new Column<Nota>(notas)
			.setTitle("Fecha")
			.bindContentsToProperty("fecha")
		new Column<Nota>(notas)
			.setTitle("Descripcion")
			.bindContentsToProperty("descripcion")
		new Column<Nota>(notas).setTitle("Aprobado")
			.bindContentsToTransformer([nota | if (nota.estaAprobado) "SI" else "NO"])
	}

	override protected addActions(Panel actionsPanel) {
		
		
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.actualizarMaterias]
		dialog.open
	}

	def getHomeMaterias() {
		ApplicationContext::instance.getSingleton(typeof(Materia)) as HomeMaterias
	}

	def getHomeNivel() {
		 ApplicationContext::instance.getSingleton(typeof(Nivel)) as HomeNivel
	}

	def void crearMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
	}
	
	def void editarNota() {
		this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))
	}
	
	def void agregarNota(){
		this.openDialog(new AgregarNotaWindow(this, new Nota()))
		
	}
}
