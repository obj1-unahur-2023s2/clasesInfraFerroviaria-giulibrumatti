class VagonDePasajeros {
	
	var largo 
	var ancho
	var tieneBanio
	var estaOrdenado
	var pasajeros
	
	method calcularCantPasajeros(){
		if(ancho <= 3){
			pasajeros = largo * 8 		
		}else{
			pasajeros = largo * 10
		}
		
		if(!estaOrdenado){
			pasajeros -= 15
		}
		return pasajeros
	}
	
	method calcularCargaMaxima(){
		if(tieneBanio){
			return 300
		} else {
			return 800
		}
	}
	
	method calcularPesoMaximo() = 2000 + 80 * self.calcularCantPasajeros() + self.calcularCargaMaxima()
	
	 
	
	
	
}
