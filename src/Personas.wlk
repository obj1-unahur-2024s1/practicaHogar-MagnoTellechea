import Habitaciones.*

class Persona {
	var property dormitorio
	var edad
	var property tieneHabilidadesEnCocina
	var property estaOcupandoElDormitorio
	method duermeEn(unDormitorio) = dormitorio == unDormitorio 
	method cumplirAnio(){
		edad += 1
	}
	method edad() = edad
	method estaAGusto(unaHabitacion)
}

class Obsesivo inherits Persona {
	override method estaAGusto(unaHabitacion) = unaHabitacion.ocupantes().size() <= 2
}

