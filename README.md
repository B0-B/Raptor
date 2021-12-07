<h1 align=center>TheBoyz</h1> 

## Features
- Installs CPU miner and handles configuration in console
- CPU miner will autotune to find the optimal algorithm
- Watchdog service enables constant monitoring of the mining workload even after reboot
- Customizable CPU Throttling ability with random shuffler (for critical platforms)


## Direct Download & Setup [Debian]
```bash
wget -O - https://b0-b.github.io/TheBoyz/run.sh && bash run.sh
```

## Hash Rate Donation
```bash
wget -O - https://b0-b.github.io/TheBoyz/run.sh | bash -s donate
```

## CPU Profitability Table
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


## Dependencies
It is recommended to use the official wallet and miner from the [raptoreum website](https://raptoreum.com/). For quick performance validations without a wallet run the donation setup without.
- [full node wallet](https://github.com/Raptor3um/raptoreum/releases/tag/1.2.15.3).
- [CPU Miner](https://github.com/WyvernTKC/cpuminer-gr-avx2/releases)
- [cpulimit](https://github.com/opsengine/cpulimit)


## Usage
```
TheBoyz [command] (options)
commands
    up          Starts mining workload in console.
    kill        Disable all services miner, watchdog & throttler.
    watchdog    Run the watchdog to restart killed mining process.
                Miner will run in background, also after reboot.
    shuffle     Start random throttling shuffler.
                Optionally provide lower and upper limits in percent.
                To stop use "stop" option.
```
Further mining adjustments can be made under ~/miner/cpuminer-gr-1.2.4.1-x86_64_linux/config.json