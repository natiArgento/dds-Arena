package dds2014.home

import dds2014.dominio.Nivel
import org.apache.commons.collections15.Predicate
import org.uqbar.arena.widgets.List
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable

@Observable
class HomeNivel extends CollectionBasedHome<Nivel> {

	new() {
		this.init
	}

	def init() {
		this.create("1 er cuatrimestre", " 1 er nivel")
		this.create("2 do cuatrimestre", "1 er nivel")
		this.create("anual", "1 er nivel")
		this.create("anual", "2do nivel")
		this.create("anual", "3er nivel")
		this.create("1er cuatrimestre", "2do nivel")
		this.create("2 do cuatrimestre", "2do nivel")
		

	}
	
	def void create(String nroCuatri, String nroNivel) {
		var nivel = new Nivel
		nivel.nroCuatri=nroCuatri
		nivel.nroNivel= nroNivel
		this.create(nivel)
	}
	
	
	
	def Nivel get(String nroCuatri) {
		niveles.findFirst[ nivel | nivel.nroCuatri.equals(nroCuatri) ]
	}
	
	def List<Nivel> getNiveles() {
		allInstance
	}
	
	override def Class<Nivel> getEntityType() {
		typeof(Nivel)
	}

	override def createExample() {
		new Nivel()
	}

	override def Predicate<Nivel> getCriterio(Nivel example) {
		null
	}
	

}