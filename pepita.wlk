object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaParaVolar(distancia)
	}

	method validarVolar(distancia){
		if(! self.puedeVolar(distancia)){
			self.error("no tengo suficiente energia para poder volar")
		}
	}

	method validarComer(comida){}

	method puedeVolar(distancia){

		return energia > self.energiaParaVolar(distancia)
	}

	method energiaParaVolar(distancia){

		return 10 + distancia
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	var ultimaComida = manzana
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		self.validarComer(comida)
		ultimaComida = comida
		energia += 	comida.energiaQueAporta() / 2
		
	}

	method validarComer(comida){
		
		if(! self.puedeComer(comida)){
			self.error("no quiero repetir la misma comida, soy delicado")
		}
	}

	method puedeComer(comida){

		return ultimaComida != comida
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaParaVolar(distancia)
	}

	method validarVolar(distancia){

		if( not self.puedeVolar(distancia)){
			self.error("No Tengo Suficiente energia para volar")
		}
	}

	method puedeVolar(distancia){

		return energia > self.energiaParaVolar(distancia)
	}

	method energiaParaVolar(distancia) = 20 + (2*distancia)

	method ultimaComida(){

		return ultimaComida
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}

	method cenas(){

		return cenas
	}

	method ave() = ave
}

// responsabilidades 

// self.error ("mensaje")

//method <nombreMensaje> (){} 1. self validar() 2. logica de negocio



