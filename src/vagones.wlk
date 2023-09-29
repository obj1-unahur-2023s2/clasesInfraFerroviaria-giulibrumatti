class VagonDePasajeros {
	
	const property largo 
	const property ancho
	const property tieneBanio
	var property estaOrdenado = true
	
	method cantidadPasajeros(){
		const pasajeros = if(ancho <= 3){8 * largo}else{10 * largo}
		
		return if(!estaOrdenado){0.max(pasajeros - 15)}else{pasajeros}
	}
	
	method cargaMaxima(){
		if(tieneBanio){
			return 300
		} else {
			return 800
		}
	}
	
	method pesoMaximo() = 2000 + 80 * self.cantidadPasajeros() + self.cargaMaxima()
	
	method esPopular() = self.cantidadPasajeros() > 50
	
	method esCarguera() = self.cargaMaxima() >= 1000
	
	method mantenimiento() {
		estaOrdenado = true
	}
	
	method esDePasajeros() = self.cantidadPasajeros() > 0
}

class VagonDeCarga{
	var property maderasSueltas
	const property cargaMaximaIdeal
	
	method tieneBanio() = false
	
	method pesoMaximo() = 1500 + self.cargaMaxima()
	
	method cargaMaxima() = 0.max(cargaMaximaIdeal - (400 * maderasSueltas))
	
	method cantidadPasajeros() = 0
	
	method esPopular() = self.cantidadPasajeros() > 50
	
	method esCarguera() = self.cargaMaxima() >= 1000
	
	method mantenimiento(){
		maderasSueltas = 0.max(maderasSueltas - 2)
	}
	
	method esDePasajeros()= false
}

class VagonDormitorio{
	const property compartimientos	
	var property camasPorCompartimiento
	
	method tieneBanio() = true
	
	method cantidadPasajeros() = compartimientos * camasPorCompartimiento
	
	method cargaMaxima() = 1200
	
	method pesoMaximo() = 4000 + (80 * self.cantidadPasajeros()) + self.cargaMaxima()
	
	method esPopular() = self.cantidadPasajeros() > 50
	
	method esCarguera() = self.cargaMaxima() >= 1000
	
	method mantenimiento(){

	}
	
	method esDePasajeros()= false
	
}


