package dds2014.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import dds2014.dominio.Nota
import org.apache.commons.collections15.Predicate

@Observable
class HomeNotas extends CollectionBasedHome<Nota> {
	
	new() {
		this.init
	}
	
	def void init() {
		this.create("1 parcial", 25052012, true)
		this.create("tp", 30102013, true)
		this.create("2 parcial", 28102012, true)
		this.create("parcial", 15092013, false)
		this.create("parcial", 29062014, true)
		this.create("parcial 1", 12062013, true)
		this.create("parcial 2", 17112013, true)
	}
	
	def void create(String descripcion, int fecha, boolean aprobacion) {
		var nota = new Nota()
		nota.asignarValores(descripcion,fecha,aprobacion)
		this.create(nota)
	}
	
	override def Class<Nota> getEntityType() {
		typeof(Nota)
	}

	override def createExample() {
		new Nota()
	}

	override def Predicate<Nota> getCriterio(Nota example) {
		null
	}

}
