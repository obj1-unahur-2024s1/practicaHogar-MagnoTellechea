class Casa {
	const property habitaciones = #{}
	method habitacionesOcupadas() = habitaciones.filter({habitacion => not habitacion.estaVacia()})
	method responsablesDeCasa() = self.habitacionesOcupadas().map({habitacion => habitacion.ocupanteMasViejo()})
}

