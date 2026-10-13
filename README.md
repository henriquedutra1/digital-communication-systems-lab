# digital-communication-systems-lab

MATLAB simulations from the *Digital Communication Systems Lab I* course of the Telecommunications Engineering program at the Federal University of Santa Maria (UFSM), taught by Prof. Candice Müller.

Each experiment is a complete transmitter, channel and receiver chain, with the code, the figures and a written report.

## Experiments

| Experiment | Topic | What it shows |
|---|---|---|
| [QPSK and 16-QAM performance](Performance%20Evaluation%20of%20QPSK%20and%2016-QAM%20Systems) | Modulation over an AWGN channel, with and without block channel coding | Simulated BER against the theoretical curves, spectra and constellations at different SNRs, and the gain from error correction |
| [LMS equalization over dispersive channels](LMS%20Equalization%20of%20QPSK%20and%2016-QAM%20over%20Dispersive%20Channels) | QPSK and 16-QAM over multipath channels (Brazil A and B profiles) | Channel modeling, constellations and BER before and after an adaptive LMS equalizer |

More experiments will be added over time.

## Topics covered

- Digital modulation: QPSK and 16-QAM mapping and demapping
- Root-raised cosine pulse shaping and carrier modulation
- AWGN channel and bit error rate (BER) analysis
- Block channel coding with syndrome decoding
- Multipath channel modeling (FIR difference equations, frequency response)
- Adaptive equalization with the LMS algorithm

## Repository structure

Each experiment lives in its own folder:

```
<experiment folder>/
├── README.md     (objectives, method and main results)
├── *.mlx         (main Live Script)
├── *.m           (function files used by the script)
└── results/      (report in PDF and key figures)
```

## Running the code

Open the experiment's `.mlx` file in MATLAB, with its `.m` function files in the same folder or on the MATLAB path. The simulations use the Communications Toolbox (`awgn`, `rcosdesign`, `berawgn`).

## Author

Henrique Silveira Dutra, Telecommunications Engineering student at UFSM.
[GitHub](https://github.com/henriquedutra1)
