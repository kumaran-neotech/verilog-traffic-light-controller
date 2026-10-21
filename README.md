# verilog-traffic-light-controller
Traffic light controller using Verilog HDL, finite-state machines, and simulation-based verification.
<CodeBlock language="markdown" editable>
# Verilog Traffic Light Controller

Overview
A digital traffic-light controller designed using
Verilog HDL and simulated using Icarus Verilog.
Features
- Three-state finite-state machine (FSM)
- Clock-driven state transitions
- Asynchronous active-high reset
- Timer-based control
- Testbench with automatic PASS/FAIL checks
- Simulation waveform generation
Traffic Light Sequence
RED -> GREEN -> YELLOW -> RED

Each state lasts five clock intervals in this
simulation.
Technologies Used
- Verilog HDL
- EDA Playground
- Icarus Verilog 12.0
- EPWave
Project Files
- traffic_light.v - Circuit design
- tb_traffic_light.v - Verification testbench
How to Run
1. Open EDA Playground.
2. Select Verilog and Icarus Verilog.
3. Paste the design into the Design pane.
4. Paste the testbench into the Testbench pane.
5. Run the simulation and inspect the output.
Verification
The testbench checks the reset state and the
RED -> GREEN -> YELLOW -> RED sequence.
Future Improvements
- Different durations for each light
- Additional automated test cases
- FPGA implementation
Author
Kumaran
Electronics and Communication Engineering Student
</CodeBlock>

<box gap={2}>
  <row align="center" gap={2}>
    <icon name="file-code" size="lg" color="secondary"/>
    <box flex="1" gap={1}>
      **`traffic_light.v`**
      <text color="secondary" size="sm">Design source</text>
    </box>
    <button variant="outline" size="sm" onClick={() => GenUI.copy("traffic_light.v")}>Copy name</button>
  </row>
  <row align="center" gap={2}>
    <icon name="file-code" size="lg" color="secondary"/>
    <box flex="1" gap={1}>
      **`tb_traffic_light.v`**
      <text color="secondary" size="sm">Testbench</text>
    </box>
    <button variant="outline" size="sm" onClick={() => GenUI.copy("tb_traffic_light.v")}>Copy name</button>
  </row>
  <row align="center" gap={2}>
    <icon name="file-text" size="lg" color="secondary"/>
    <box flex="1" gap={1}>
      **`README.md`**
      <text color="secondary" size="sm">Project documentation</text>
    </box>
    <button variant="outline" size="sm" onClick={() => GenUI.copy("README.md")}>Copy name</button>
  </row>
</box>