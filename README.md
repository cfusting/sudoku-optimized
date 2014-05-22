sudoku-optimized
==============

Example of optimizing a Sudoku solver in Julia.

Julia code can often be optimized.  This is an example of a 
Sudoku solver with two small optimizations:

1.  x_from and y_from typed to be Int64.

2.  Inner loop of is_valid moved into its own function.

See

```bash
diff sudoku.jl sudoku-optimal.jl | view -
```

After optimization we observe nearly a 5x speed increase.

Thanks @firstEncounter for translating the solver from Javascript.
