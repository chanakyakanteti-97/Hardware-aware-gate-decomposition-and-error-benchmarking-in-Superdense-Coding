OPENQASM 3.0;
include "stdgates.inc";

qubit[5] q;
bit[2] c;

// 1. Entanglement
ry(pi / 2) q[0];
cx q[0], q[1];
// 2. Initial Parity Setup & Error Injection

rx(pi) q[1];
cx q[1], q[2];
ry(pi / 2) q[3];
cx q[3], q[1];
// 3. Alice Encodes '11' & Arbitrary Phase Error

rx(pi) q[1];
rz(pi / 3) q[1];
// 4. Syndrome Extraction
cx q[0], q[2];


ry(pi / 2) q[4];
cx q[4], q[0];

// 5. Automated Error Correction
cx q[4], q[1];
cx q[1], q[4];
cx q[3], q[1];
ry(-pi / 2) q[3];
cz q[1], q[3];
// 6. Bell Basis Decoding
cx q[0], q[2];
cx q[1], q[2];
cx q[2], q[1];
cx q[0], q[1];
// Measurement
ry(-pi / 2) q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
