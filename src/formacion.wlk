import vagones.*

class Formacion{
	const vagones = new List()
	
	method cantidadPasajerosLleva() = vagones.sum({v => v.cantidadPasajeros()})
	
	method cantidadVagonesPopulares() = vagones.count({v => v.esPopular()})
	
	method esFormacionCarguera() = vagones. all({v => v.esCarguera()})
	
	method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
	
	method vagonMenosPesado() = vagones.min({v => v.pesoMaximo()})
	
	method dispersionPesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMenosPesado().pesoMaximo()
	
	method cantidadBanios() = vagones.count({v => v.tieneBanio()})
	
	method hacerMantenimiento(){
		vagones.forEach({v => v.mantenimiento()})
	}
	
	method formacionConPasajeros() = vagones.filter({v => v.cantidadPasajeros() > 0})
	
	method formacionConMasPasajeros() = self.formacionConPasajeros().max({v => v.cantidadPasajeros()})
	
	method formacionConMenosPasajeros() = self.formacionConPasajeros().min({v => v.cantidadPasajeros()})
	
	method estaEquilibrada() = (self.formacionConMasPasajeros().cantidadPasajeros() - 
		self.formacionConMenosPasajeros(). cantidadPasajeros()) <= 20
	
	method estaOrganizada() =
	not (1..vagones.size()-1).any({i => not vagones.get(i - 1).esDePasajeros() && 
		 vagones.get(i).esDePasajeros()
	})
	
}
