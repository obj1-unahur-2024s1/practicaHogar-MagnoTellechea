import Personas.*

class Habitacion{
	const property ocupantes = #{}
	method confortAportadoA(persona) = 10
	method puedeEntrar(unaPersona)
	method estaVacia() = ocupantes.isEmpty()
	method hayUnNinio() = ocupantes.any({ocupante => ocupante.edad() <= 4})
	method ocupanteMasViejo() = ocupantes.max({ocupante => ocupante.edad()}) 
}

class HabitacionUsoGeneral inherits Habitacion{
	override method puedeEntrar(unaPersona) = true
}

class Bano inherits Habitacion {
	override method confortAportadoA(persona){
		return (super(persona) + if (persona.edad() <= 4) 2 else 4)
	}
	override method puedeEntrar(unaPersona){
		return (self.estaVacia() || self.hayUnNinio())
	}
}

class Dormitorio inherits Habitacion {
	var property cantPersonasDurmiendo
	 override method confortAportadoA(persona){
	 	return(super(persona) + if (persona.duermeEn(self)) 10 / cantPersonasDurmiendo else 0)
	 }
	 override method puedeEntrar(unaPersona){
	 	return unaPersona.duermeEn(self) || ocupantes.all({ocupante => ocupante.estaOcupandoElDormitorio()})
	 }
}

class Cocina inherits Habitacion {
	const property cantMetrosCuadrados
	override method confortAportadoA(persona){
		return (super(persona) + if (persona.tieneHabilidadesEnCocina()) cantMetrosCuadrados * porcentajeActual.valorActual() else 0
		)
	}
	override method puedeEntrar(unaPersona){
		return self.estaVacia() || not unaPersona.tieneHabilidadesEnCocina() || ocupantes.all({ocupante => not ocupante.tieneHabilidadesEnCocina()})
	}
}

object porcentajeActual {
	var property valorActual = 0.1
} 