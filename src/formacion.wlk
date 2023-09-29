import vagones.*
import locomotoras.*

class Formacion{
	const vagones = new List()
	const locomotoras = new List()
	
	method agregarVagon(nuevoVagon){
		vagones.add(nuevoVagon)
	}
	
	method agregarLocomotora(nuevaLoco){
		locomotoras.add(nuevaLoco)
	}
	
	
	method desarmarFormacion(){
		vagones.clear()
	}
	
	method cantidadPasajerosLleva() = vagones.sum({v => v.cantidadPasajeros()})
	
	method cantidadVagonesPopulares() = vagones.count({v => v.esPopular()})
	
	method esFormacionCarguera() = vagones. all({v => v.esCarguera()})
	
	method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
	
	method locomotoraMasPesada() = locomotoras.max({l => l.peso()})
	
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
		 vagones.get(i).esDePasajeros()})
		 
	method velocidadMaximaDeLocomotoras() = self.locomotoraMasLenta().velocidadMax()
	
	method locomotoraMasLenta() = locomotoras.min({l => l.velocidadMax()})
	
	method sonEficienteLasLocomotoras() = locomotoras.all({l => l.esEficiente()})
	
	method puedeMoverse() = self.sumaDelArrastre() >= self.pesoFormacion()
	
	method pesoDeVagones() = vagones.sum({v => v.pesoMaximo()})
	
	method pesoLocomotoras() = locomotoras.sum({l => l.peso()})
	
	method pesoFormacion() = self.pesoDeVagones() + self.pesoLocomotoras()
	
	method sumaDelArrastre() = locomotoras.sum({l => l.arrastre()})
	
	method kilosDeEmpujeFaltante() = 0.max(self.pesoFormacion() - self.sumaDelArrastre())
	
	method esCompleja() = self.unidadesDeLaFormacion() > 8 || self.pesoFormacion() > 80000
	
	method unidadesDeLaFormacion() = vagones.size() + locomotoras.size()
}
