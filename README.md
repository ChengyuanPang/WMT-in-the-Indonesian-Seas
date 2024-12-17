# Variability due to seasonal cycle, eddies, and tides enhances water mass transformation in the Indonesian Seas
This project provides the raw data and code to reproduce the figures of a paper submitted to JGR-oceans
The raw data are saved in Matlab data format. Plsese download all files into a folder and run the script.m under MATLAB. The code and data to reproduce key results are shown below. Full model outputs are available upon request to the corresponding author.

## Raw Data

### `neutral_D.mat`:
 
`neutral_D` is the 3 dimensional raw data to produce the vertical density section (figure 1) in the Indonesian Seas. The varible 'mean' is the annual mean neutral density and 'April' and 'August' represent the monthly mean of neutral density in April and August. 

### `Fig2.mat`:
 
`Fig2.mat` is the raw data to plot the bathymetry, surface temperature, and vertical velocity in figure 2. Within the data file, variables named as `XC`, `YC`, `T` and `D` represent longitude, latitude, surface temperature and ocean depth, respectively. 

### `T-S diagram.mat`:

Using this data file can reproduce the T-S diagram (Figure 3) in the paper. 'T_10km', 'T_4km', and 'T_2km' represents the temprature of tidal model with 3 different resolution. 'T_NT' represents the temperature 2 km no-tide model. 'ACCESS' and 'CARS' represent the data of the access model and CARS climatology. Salinity is named in similar format
CARS climatology can be accessed through link (http://www.marine.csiro.au/~dunn/cars2009/).

### `Mixing.mat`:

The file provide the 3 dimentional vertical diffusivity in the model. 'Tide' is the tidal model and 'NT' is the no-tide model.

### `WMT.mat`:

The files provide the data to reproduce the figure 5 - water mass transformation rates. 'Tide' represent the tidal model and 'NT' is the no-tide model.

### `velocity.mat`:

The files provide the data of 3D velocity and surface wind speed used to produce figure 6.

## Code

### `scripts.m`：

`scripts.m` includes 6 parts which, in turn, provide the code to produce the 6 figures in the paper.
