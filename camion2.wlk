import cosas.*
object camion {
    const bultos = []
    const cosas = []
    var tara = 1000
    method bultosCargados() {
        bultos.sum({b=>b.bultoQueOcupa()})
    }
    method pesoTotal() {
        return tara + cosas.sum({c => c.peso()})
    }
    method cargarCosas(unaCosa) {
      cosas.add(unaCosa)
    }
    method descargarCosas(unaCosa) {
      cosas.remove(unaCosa)
    }
    method cargaPar() {
      cosas.all({cosa => cosa.peso() % 2 == 0})
    }
    method cosaPesoEspecifico(unPeso) {
      cosas.find({c => c.peso() == unPeso})
    }
    method primerCosaCargada() {
      cosas.first({c => c.peligrosidad()})
    }
    method obtenerCosasPeligrosidad() {
      cosas.filter({c => c.peligrosidad() > 100})
    }
    method cosasQueSuperenPeligrosidad(unaCosa){
        cosas.map({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }
    method estaExcedido() {
      return self.pesoTotal() > 2500
    }
    method puedeCircular(nivelPeligrosidad) {
        return not(self.estaExcedido()) and cosas.forEach({c => c.peligrosidad() < nivelPeligrosidad})
    }
    method cosaMasPesadaCargada() {
        return cosas.max({c => c.peso()})
    }

}