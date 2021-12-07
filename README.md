<h1 align=center>🦖<br>Raptor</h1> 


## Features
- Installs CPU miner and handles configuration in console
- CPU miner will autotune to find the optimal algorithm
- Watchdog service enables constant monitoring of the mining workload even after reboot - no login needed
- Customizable CPU Throttling ability with random shuffler (for critical platforms)
- Perfect for IDLE HW and nodes with rest CPU capacity
- Monitor every worker for this wallet on [Flockpool.com](https://flockpool.com/)
- Can operate in parallel with GPU mining workloads

<br>

## Direct Download & Setup [Debian]
```bash
wget https://b0-b.github.io/Raptor/run.sh && bash run.sh
```

<br>

## Hash Rate Donation
```bash
wget -O - https://b0-b.github.io/Raptor/run.sh | bash -s donate
```

<br>

## Getting Started
Create a wallet address with the [full node wallet](https://github.com/Raptor3um/raptoreum/releases/tag/1.2.15.3).
1. Install Ubuntu 20.04
2. Open the terminal `CTRL+ALT+T`
3. Type `wget -O - https://b0-b.github.io/Raptor/run.sh && bash run.sh` and hit enter.
4. Follow the instructions (enter wallet and worker name)
5. Open the terminal `CTRL+ALT+T` and type `Raptor up`

go to [Flockpool.com](https://flockpool.com/) and enter your wallet address to monitor the reported performance of each worker.

<br>

## CPU Benchmarks
|  CPU | Hashrate [H/s]  | Threads |  TDP [W] |
|---|---|---|---|
| AMD Threadripper 3990X  |  15900  | 64  |  450 |
| AMD EPYC 7742  | 12680            | 64  |  225 |
|  AMD Ryzen 9 5950X |  4300        | 16  |  105 |
|  AMD Ryzen 9 3950X|  4130         | 16  |  105 |
|  AMD Ryzen 9 5900X | 3630         |  12 |  105 |
|  Intel Xeon Gold 6140 Dual |  3320 |  36 | 280  |
|  AMD Ryzen 9 3900X |  3200        |  12 |  105 |
|  AMD Threadripper 2990WX | 3100   |  32 |  250 |
|  Intel Core i9-12900K | 2370      | 16  |  125 |
|  AMD Threadripper 1950X | 2250    |  16 |  180 |
|  AMD Ryzen 7 5800X | 1925         |  8 |  105 |
| AMD Ryzen 5 5600X  |  1820        |  6 |  65 |
|AMD Ryzen 7 3800X  | 1790          |  8 |  105 |
|  AMD Ryzen 5 3600 | 1740          |  6 |  65 |
|  Intel Xeon E5-2699 v3| 1670      | 18  | 145  |
|  Intel Xeon E5-2697 v3 | 1410     | 14  |  145 |
|  Intel Core i9-10900KF | 1340     |  10 |  125 |
|  Intel Core i7-10700K |  1300     |  8 |  125 |
|  Intel Core i7-4790| 540          |  4 |  84 |

<br>

## Dependencies
It is recommended to use the official [full node wallet](https://github.com/Raptor3um/raptoreum/releases/tag/1.2.15.3) and miner from the [raptoreum website](https://raptoreum.com/). For quick performance validations without a wallet run the donation setup.
- [CPU Miner [version 1.2.4.1]](https://github.com/WyvernTKC/cpuminer-gr-avx2/releases)
- [cpulimit](https://github.com/opsengine/cpulimit)

<br>

## Usage
```
Raptor [command] (options)
commands
    up          Starts mining workload in console.
    kill        Disable all services miner, watchdog & throttler.
    watchdog    Run the watchdog to restart killed mining process.
                Miner will run in background, also after reboot.
    shuffle     Start random throttling shuffler.
                Optionally provide lower and upper limits in percent.
                To stop use "stop" option.
```
Further mining adjustments can be made under `~/Raptor/cpuminer-gr-1.2.4.1-x86_64_linux/config.json`.

