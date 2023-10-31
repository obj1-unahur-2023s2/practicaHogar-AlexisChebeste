class Persona {
	const property edad
	var property tieneHabilidadesDeCocina 
	var habitacionDondeEsta = null
	
	method habitacionDondeEsta() = habitacionDondeEsta
	method entrar(habitacion){
		if (! habitacion.puedeEntrar(self)){
			self.error("Donde vas amigo??")
		}
		habitacion.ingresar(self)
		habitacionDondeEsta = habitacion
	}
	method confortTotal(casa) {return casa.habitaciones().sum({hab => hab.confort(self)})}
	method seSienteAGusto(casa,familia)
}

class Obsesives inherits Persona{
	override method seSienteAGusto(casa,familia){
		return casa.habitaciones().any{hab => hab.puedeEntrar(self)}
			and casa.habitaciones().all{hab => hab.ocupantes().size() <= 2}
	}
}

class Goloses inherits Persona{
	override method seSienteAGusto(casa,familia){
		return casa.habitaciones().any{hab => hab.puedeEntrar(self)}
			and familia.integrantes().any{pers => pers.tieneHabilidadesDeCocina()}
	}
}

class Sencilles inherits Persona{
	override method seSienteAGusto(casa,familia){
		return casa.habitaciones().any{hab => hab.puedeEntrar(self)}
			and casa.habitaciones().size() > familia.integrantes().size()
	}
}

