var N: Int = 20
var tablero: [[Int]] = Array(repeating: Array(repeating:  0, count: N), count: N )
var generacion: Int = 0
var poblacion: Int = 0
func inicializarTablero() -> Void{
  tablero = Array(repeating: Array(repeating:  0, count: N), count: N )
  tablero[N/2][N/2] = 1
  tablero[N/2][N/2 + 1] = 1
  tablero[N/2 - 1][N/2] = 1
  tablero[N/2 + 1][N/2] = 1
  tablero[N/2 - 1][N/2 - 1] = 1
  poblacion = 5
}

func imprimirTablero() -> Void{
  print("Generacion: \(generacion)")
  print("Poblacion: \(poblacion)")
  for linea in tablero{
    print(linea)
  }
}

func vecinos(_ x: Int, _ y: Int) -> Int{
  var vecinosVivos: Int = 0
  for i in -1 ... 1 {
    for j in -1 ... 1 {
      if (x+i >= 0 && x + i <= N-1) && (y+j >= 0 && y + j <= N-1) && (i != 0 || j != 0){
        vecinosVivos += tablero[x+i][y+j]
      }
    }
  }
  return vecinosVivos
}

func siguienteTablero() -> Void{
  var nuevoTablero: [[Int]] = Array(repeating: Array(repeating:  0, count: N), count: N )
  var p: Int = 0
  for i in 0 ... N-1 {
    for j in 0 ... N-1 {
      let v = vecinos(i, j)
      if tablero[i][j] == 0 && v == 3 || (tablero[i][j] == 1 && (v == 2 || v == 3)){
        nuevoTablero[i][j] = 1
        p += 1
      }else{
        nuevoTablero[i][j] = 0
      } 
    }
  }
  tablero = nuevoTablero
  generacion += 1
  poblacion = p
}

func juegoDeLaVida(_ n: Int, _ g: Int) -> Void{
  N = n
  inicializarTablero()
  print(imprimirTablero())
  while generacion < g {
    siguienteTablero()
    print(imprimirTablero())
  }
}

juegoDeLaVida(10, 5)