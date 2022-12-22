using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using QSharpTest;

using var sim = new QuantumSimulator();
var result = await RandomNumberInRange.Run(sim, 50);
var (q1Zero, q1One, q2Zero, q2One) = await TestBellState.Run(sim, 10, Result.One);

Console.WriteLine(result);
Console.WriteLine($"{q1Zero}, {q1One}, {q2Zero}, {q2One}");