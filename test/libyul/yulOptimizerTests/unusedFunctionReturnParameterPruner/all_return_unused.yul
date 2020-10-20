{
    let a, b, c := f(sload(0))
    function f(d) -> x, y, z
    {
       y := mload(d)
       z := mload(2)
       sstore(y, z)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     let a, b, c := f_6(sload(0))
//     function f(d)
//     {
//         let x, y, z
//         y := mload(d)
//         let y_4 := y
//         z := mload(2)
//         sstore(y_4, z)
//     }
//     function f_6(d_7) -> x_8, y_9, z_10
//     { f(d_7) }
// }
