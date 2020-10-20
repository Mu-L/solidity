{
    // The third and the last return value is unused
    let a, b, c, d, e := f(sload(0))
    sstore(a, b)
    let a1, b1, c1, d1, e1 := f(sload(1))
    sstore(a1, d1)
    let a2, b2, c2, d2, e2 := f(sload(2))
    sstore(d2, b2)
    function f(a_1) -> v, w, x, y, z
    {
       w := mload(a_1)
       y := mload(w)
       z := mload(y)
       sstore(y, z)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     let a, b, c, d, e := f_10(sload(0))
//     sstore(a, b)
//     let a1, b1, c1, d1, e1 := f_10(sload(1))
//     sstore(a1, d1)
//     let a2, b2, c2, d2, e2 := f_10(sload(2))
//     sstore(d2, b2)
//     function f(a_1) -> v, w, y
//     {
//         let x, z
//         w := mload(a_1)
//         y := mload(w)
//         let y_8 := y
//         z := mload(y_8)
//         sstore(y_8, z)
//     }
//     function f_10(a_1_11) -> v_12, w_13, x_14, y_15, z_16
//     { v_12, w_13, y_15 := f(a_1_11) }
// }
