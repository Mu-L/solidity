{
    // b and c are unused
    let a, b, c := f(sload(0))
    sstore(a, 0)
    function f(d) -> x, y, z
    {
       y := mload(d)
       z := mload(2)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     let a, b, c := f_7(sload(0))
//     sstore(a, 0)
//     function f(d) -> x
//     {
//         let y, z
//         y := mload(d)
//         z := mload(2)
//     }
//     function f_7(d_8) -> x_9, y_10, z_11
//     { x_9 := f(d_8) }
// }
