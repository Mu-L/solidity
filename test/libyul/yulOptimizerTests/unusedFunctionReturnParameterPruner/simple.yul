{
    let c, d := f(1, 2)
    sstore(c, 1)
    function f(x, y) -> a, b
    {
        a := sload(x)
        b := sload(y)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     let c, d := f_6(1, 2)
//     sstore(c, 1)
//     function f(x, y) -> a
//     {
//         let b
//         a := sload(x)
//         b := sload(y)
//     }
//     function f_6(x_7, y_8) -> a_9, b_10
//     { a_9 := f(x_7, y_8) }
// }
