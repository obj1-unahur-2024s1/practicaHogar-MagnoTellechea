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
	
}
