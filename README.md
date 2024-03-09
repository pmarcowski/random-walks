# Simulate random walks in one, two, or three dimensions
This repository contains scripts for simulating random walks in one, two, and three dimensions. It includes R scripts for 1D and 2D simulations, and a Python script for the 3D simulation. Agents move randomly within their respective spaces, and the scripts visualize these trajectories. Parameters to control the number of agents, number of steps per agent, and random or centralized starting positions (2D, 3D) are configurable.

## Features
- One-dimensional random walk simulation (*1d_random_walk.R*)
- Two-dimensional random walk simulation (*2d_random_walk.R*)
- Three-dimensional random walk simulation (*3d_random_walk.py*)

## License
This code is licensed under the MIT license found in the LICENSE file in the root directory of this source tree.

## Usage
To run the R simulations, you will need R installed on your computer. You can then execute the desired script in an R environment.

To run the Python simulation, ensure that Python is installed on your computer and execute the desired script.

### Parameters
Modify the following parameters within each script to customize the simulations:

- `n_agents`: Number of agents in the simulation.
- `n_walks`: Number of steps each agent takes.
- `random_starts` (2D, 3D): Determines if agents start randomly or at the origin.
- `start_range` (2D, 3D): If random_starts is True, sets the area for randomizing start positions.

## Installation
No additional installations are required beyond R (for R scripts) and the standard Python scientific libraries (for the Python script). To run the scripts, clone this repository or download the script files and execute it within the appropriate environment.
