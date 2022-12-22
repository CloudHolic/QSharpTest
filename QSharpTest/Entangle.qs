namespace QSharpTest {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation SetQubitState(desired: Result, target: Qubit) : Unit {
        if desired != M(target) {
            X(target);
        }
    }

    operation TestBellState(count: Int, initial: Result) : (Int, Int, Int, Int) {
        mutable numOnesQ1 = 0;
        mutable numOnesQ2 = 0;

        // Allocate the qubits.
        use (q1, q2) = (Qubit(), Qubit());
        for test in 1..count {
            SetQubitState(initial, q1);
            SetQubitState(Zero, q2);

            // Add the H operation after initialization and before measurement
            H(q1);

            // Add CNOT operation
            CNOT(q1, q2);

            // Measure each qubit
            let resultQ1 = M(q1);
            let resultQ2 = M(q2);

            // Count the number of 'Ones'
            if resultQ1 == One {
                set numOnesQ1 += 1;
            }
            if resultQ2 == One {
                set numOnesQ2 += 1;
            }
        }

        // Reset the qubits
        SetQubitState(Zero, q1);
        SetQubitState(Zero, q2);

        // Return number of |0> states, number of |1> states
        return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2);
    } 
}
