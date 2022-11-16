import chisel3._
import chisel3.util._

class Accelerator extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())

    val address = Output(UInt (16.W))
    val dataRead = Input(UInt (32.W))
    val writeEnable = Output(Bool ())
    val dataWrite = Output(UInt (32.W))

  })

  //Creating components
  //val dataMemory = Module(new DataMemory())

  //State enum and register
  val startState :: loop1 :: loop2 :: checkborder :: xinc :: checkbelow :: checkRight :: checkLeft :: checkAbove :: saveWhite :: saveBlack :: Nil = Enum(11)
  val stateReg = RegInit(startState)

  //Support registers
  val addressReg = RegInit(0.U(16.W))
  val dataReg = RegInit(0.U(32.W))

  //Default values
  io.writeEnable := false.B
  io.address := 0.U(16.W)
  io.address :=  addressReg
  io.dataWrite := dataReg
  io.done := false.B

  val x = RegInit(0.U(16.W))
  val y = RegInit(0.U(16.W))

  //FSMD switch

  switch(stateReg){
    is(startState){
      when(io.start){
        x := 0.U
        y := 0.U
        stateReg := loop1
      }
    }
    is(loop1){
      y:=0.U
      when(x<20.U(16.W)){
        stateReg := loop2
      } .otherwise{
        io.done := true.B
      }
    }
    is(loop2){
      when( y < 20.U(16.W)){
        //addressReg := x + 20.U(16.W) * y
        stateReg:=checkborder
      } .otherwise{
        //stateReg:=xinc
        x := x + 1.U(16.W)
        stateReg := loop1
      }
    }
    is(xinc){
      x:= x + 1.U(16.W)
      stateReg := loop1
    }
    is(checkborder){
      addressReg := x + 20.U(16.W) * y
      when( io.dataRead === 0.U(16.W)||x === 0.U(16.W) || x === 19.U(16.W) || y=== 0.U(16.W) || y === 19.U(16.W)){
      stateReg := saveBlack
      } .otherwise{
        stateReg := checkbelow
      }
    }
    is(checkbelow){
      addressReg := x + 20.U(16.W) * (y + 1.U(16.W))
      when(io.dataRead === 0.U(16.W)) {
        stateReg:=saveBlack
      } .otherwise{
        stateReg := checkRight
      }
    }
    is(checkRight) {
      addressReg := (x+1.U(16.W)) + 20.U(16.W) * y
      when(io.dataRead === 0.U(16.W)) {
        stateReg := saveBlack
      } .otherwise {
        stateReg := checkLeft
      }
    }
    is(checkLeft) {
      addressReg := (x - 1.U(16.W)) + 20.U(16.W) * y
      when(io.dataRead === 0.U(16.W)) {
        stateReg := saveBlack
      }.otherwise {
        stateReg := checkAbove
      }
    }
    is(checkAbove) {
      addressReg := x + 20.U(16.W) * (y - 1.U(16.W))
      when(io.dataRead === 0.U(16.W)) {
        stateReg := saveBlack
      }.otherwise {
        stateReg := saveWhite
      }
    }
    is(saveBlack){
      io.writeEnable := true.B
      io.address:= (x+20.U(16.W)*y)+400.U(16.W)
      io.dataWrite := 0.U(32.W)
      y := y + 1.U(16.W)
      stateReg:= loop2
    }
    is(saveWhite) {
      io.writeEnable := true.B
      io.address := (x + 20.U(16.W) * y)+400.U(16.W)
      io.dataWrite := 255.U(32.W)
      y := y + 1.U(16.W)
      stateReg := loop2
    }





  }


}
