namespace QSharpTest {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation QuantumRandomNumberGenerator() : Result {
        // Allocate a qubit.
        use q = Qubit();

        // Put the qubit to superposition.
        H(q);

        // It now has a 50% chance of being measured 0 or 1.
        // Measure the qubit value.
        return M(q);
    }

    operation RandomNumberInRange(max: Int) : Int {
        mutable output = 0;

        repeat {
            mutable bits = [];
            for idxBit in 1..BitSizeI(max) {
                set bits += [QuantumRandomNumberGenerator()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);

        return output;
    }
}
