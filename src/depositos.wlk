import formacion.*

class Deposito {
	const formaciones = new List()
	const locomotoras = new List()
	
	
	method obtenerLosVagonesMasPesados() = formaciones.map({f => f.vagonMasPesado()}).asSet()
	
	method necesitaConductorExperimentado() = formaciones.any({f => f.esCompleja()})
}
