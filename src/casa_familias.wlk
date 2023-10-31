import habitaciones.*
import personas.*

class Casa{
	var property habitaciones = []
	method habitacionesOcupadas() = habitaciones.filter{hab => hab.estaOcupada()}
	method responsables() = self.habitacionesOcupadas().map{hab => hab.ocupanteMasViejo()}
	method agregarHabitaciones(hab) {habitaciones.addAll(hab)}
}

class Familia{
	var property integrantes =[]
	const property vivienda
	
	method confortPromedio() = integrantes.sum{pers=> pers.confortTotal(vivienda)} / integrantes.size() 
	
	method estaAGusto(){
		return self.confortPromedio() > 40 
			and integrantes.all{hab => hab.seSienteAGusto(vivienda,self)}
	}
	method agregarIntegrante(persona) {integrantes.add(persona)}
	method agregarIntegrantes(variasPersonas) {integrantes.addAll(variasPersonas)}
}