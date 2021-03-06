// NOTE: Assertions have been autogenerated by utils/generate-test-checks.py
// RUN: circt-opt %s --convert-llhd-to-llvm | FileCheck %s


// CHECK-LABEL:   llvm.func @drive_signal(!llvm.ptr<i8>, !llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>, !llvm.ptr<i8>, !llvm.i64, !llvm.i32, !llvm.i32, !llvm.i32)

// CHECK-LABEL:   llvm.func @Foo(
// CHECK-SAME:                   %[[VAL_0:.*]]: !llvm.ptr<i8>,
// CHECK-SAME:                   %[[VAL_1:.*]]: !llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>) {
// CHECK:           %[[VAL_2:.*]] = llvm.mlir.constant(false) : !llvm.i1
// CHECK:           %[[VAL_3:.*]] = llvm.mlir.constant(0 : i32) : !llvm.i32
// CHECK:           %[[VAL_4:.*]] = llvm.getelementptr %[[VAL_1]]{{\[}}%[[VAL_3]]] : (!llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>, !llvm.i32) -> !llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>
// CHECK:           %[[VAL_5:.*]] = llvm.mlir.constant(0 : i32) : !llvm.i32
// CHECK:           %[[VAL_6:.*]] = llvm.mlir.constant(1 : i32) : !llvm.i32
// CHECK:           %[[VAL_7:.*]] = llvm.getelementptr %[[VAL_4]]{{\[}}%[[VAL_5]], %[[VAL_5]]] : (!llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>, !llvm.i32, !llvm.i32) -> !llvm.ptr<ptr<i8>>
// CHECK:           %[[VAL_8:.*]] = llvm.load %[[VAL_7]] : !llvm.ptr<ptr<i8>>
// CHECK:           %[[VAL_9:.*]] = llvm.getelementptr %[[VAL_4]]{{\[}}%[[VAL_5]], %[[VAL_6]]] : (!llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>, !llvm.i32, !llvm.i32) -> !llvm.ptr<i64>
// CHECK:           %[[VAL_10:.*]] = llvm.load %[[VAL_9]] : !llvm.ptr<i64>
// CHECK:           %[[VAL_11:.*]] = llvm.bitcast %[[VAL_8]] : !llvm.ptr<i8> to !llvm.ptr<i16>
// CHECK:           %[[VAL_12:.*]] = llvm.load %[[VAL_11]] : !llvm.ptr<i16>
// CHECK:           %[[VAL_13:.*]] = llvm.trunc %[[VAL_10]] : !llvm.i64 to !llvm.i16
// CHECK:           %[[VAL_14:.*]] = llvm.lshr %[[VAL_12]], %[[VAL_13]] : !llvm.i16
// CHECK:           %[[VAL_15:.*]] = llvm.trunc %[[VAL_14]] : !llvm.i16 to !llvm.i1
// CHECK:           %[[VAL_16:.*]] = llvm.mlir.constant(true) : !llvm.i1
// CHECK:           %[[VAL_17:.*]] = llvm.xor %[[VAL_15]], %[[VAL_16]] : !llvm.i1
// CHECK:           %[[VAL_18:.*]] = llvm.mlir.constant(dense<[1, 0, 0]> : vector<3xi32>) : !llvm.array<3 x i32>
// CHECK:           %[[VAL_19:.*]] = llvm.mlir.constant(1 : i64) : !llvm.i64
// CHECK:           %[[VAL_20:.*]] = llvm.mlir.constant(1 : i32) : !llvm.i32
// CHECK:           %[[VAL_21:.*]] = llvm.alloca %[[VAL_20]] x !llvm.i1 {alignment = 4 : i64} : (!llvm.i32) -> !llvm.ptr<i1>
// CHECK:           llvm.store %[[VAL_17]], %[[VAL_21]] : !llvm.ptr<i1>
// CHECK:           %[[VAL_22:.*]] = llvm.bitcast %[[VAL_21]] : !llvm.ptr<i1> to !llvm.ptr<i8>
// CHECK:           %[[VAL_23:.*]] = llvm.extractvalue %[[VAL_18]][0 : i32] : !llvm.array<3 x i32>
// CHECK:           %[[VAL_24:.*]] = llvm.extractvalue %[[VAL_18]][1 : i32] : !llvm.array<3 x i32>
// CHECK:           %[[VAL_25:.*]] = llvm.extractvalue %[[VAL_18]][2 : i32] : !llvm.array<3 x i32>
// CHECK:           %[[VAL_26:.*]] = llvm.call @drive_signal(%[[VAL_0]], %[[VAL_4]], %[[VAL_22]], %[[VAL_19]], %[[VAL_23]], %[[VAL_24]], %[[VAL_25]]) : (!llvm.ptr<i8>, !llvm.ptr<struct<(ptr<i8>, i64, i64, i64)>>, !llvm.ptr<i8>, !llvm.i64, !llvm.i32, !llvm.i32, !llvm.i32) -> !llvm.void
// CHECK:           llvm.return
// CHECK:         }
llhd.entity @Foo () -> () {
  %0 = llhd.const 0 : i1
  %toggle = llhd.sig "toggle" %0 : i1
  %1 = llhd.prb %toggle : !llhd.sig<i1>
  %2 = llhd.not %1 : i1
  %dt = llhd.const #llhd.time<1ns, 0d, 0e> : !llhd.time
  llhd.drv %toggle, %2 after %dt : !llhd.sig<i1>
}
