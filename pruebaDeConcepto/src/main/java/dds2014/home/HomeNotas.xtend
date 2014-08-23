package dds2014.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import dds2014.dominio.Nota
import org.apache.commons.collections15.Predicate

@Observable



class HomeNotas extends CollectionBasedHome<Nota> {
		override def Class<Nota> getEntityType() {
		typeof(Nota)
	}

	override def createExample() {
		new Nota("1 parcial", 25052012,true)
	}

	override def Predicate<Nota> getCriterio(Nota example) {
		null
	}
	
}