package dds2014.home

import org.uqbar.commons.utils.Observable
import dds2014.dominio.Materia
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedHome
import dds2014.dominio.Nota
import java.util.List

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {
	var n1 = new Nota("1 parcial", 25052012, true)
	var n2 = new Nota("tp", 30102013, true)
	var n3 = new Nota("2 parcial", 28102012, true)
	var n4 = new Nota("parcial", 15092013, false)
	var n5 = new Nota("parcial", 29062014, true)
	var n6 = new Nota("parcial 1", 12062013, true)
	var n7 = new Nota("parcial 2", 17112013, true)


new(){
	
	this.init
}
	def init() {
		this.create("Análisis 1",2013,true,"Rinaldi", #[n6, n7])
		this.create("Matematica Discreta", 2012, true, "Demmler", #[n1, n3])
		this.create("Sintaxis", 2013, true,"Adamoli", #[n2])
		this.create("Analisis 2", 2013, false,"Cossuti", #[n4])
		this.create("Porbabilidad", 2014, true,"Fernandez", #[n5])

	}

	
	
	def void create(String nombreMat, int anio, Boolean aprobado, String profe, List<Nota> notas) {
		var materia = new Materia
		materia.nombre= nombreMat
		materia.anioCursada= anio
		materia.estaAprobada= aprobado
		materia.profesor= profe
		materia.notas= notas
		this.create(materia)
	}

	override def Class<Materia> getEntityType() {
		typeof(Materia)
	}

	override def createExample() {
		new Materia()
	}

	override def Predicate<Materia> getCriterio(Materia example) {
		null
	}

}
